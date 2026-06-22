import 'package:fleather/fleather.dart';

class LexicalConverter {
  static List<Map<String, dynamic>> lexicalToDelta(Map<String, dynamic> lexical) {
    final List<Map<String, dynamic>> ops = [];
    final Map<String, dynamic>? root = lexical['root'] as Map<String, dynamic>?;
    if (root == null) return ops;

    final List<dynamic>? children = root['children'] as List<dynamic>?;
    if (children == null) return ops;

    for (final dynamic child in children) {
      if (child is Map<String, dynamic>) {
        _processBlockNode(child, ops);
      }
    }

    if (ops.isEmpty || !(ops.last['insert'] as String).endsWith('\n')) {
      ops.add(<String, dynamic>{'insert': '\n'});
    }

    return ops;
  }

  static void _processBlockNode(Map<String, dynamic> node, List<Map<String, dynamic>> ops) {
    final String? type = node['type'] as String?;
    final List<dynamic>? nodeChildren = node['children'] as List<dynamic>?;

    if (type == 'paragraph') {
      if (nodeChildren != null) {
        for (final dynamic textNode in nodeChildren) {
          if (textNode is Map<String, dynamic>) {
            _processInlineNode(textNode, ops);
          }
        }
      }
      ops.add(<String, dynamic>{'insert': '\n'});
    } else if (type == 'heading') {
      if (nodeChildren != null) {
        for (final dynamic textNode in nodeChildren) {
          if (textNode is Map<String, dynamic>) {
            _processInlineNode(textNode, ops);
          }
        }
      }
      final String? tag = node['tag'] as String?;
      int level = 1;
      if (tag != null && tag.startsWith('h')) {
        level = int.tryParse(tag.substring(1)) ?? 1;
      }
      ops.add(<String, dynamic>{
        'insert': '\n',
        'attributes': <String, dynamic>{'heading': level},
      });
    } else if (type == 'list') {
      final String listType = node['listType'] as String? ?? 'bullet';
      final String quillListType = listType == 'number' ? 'ol' : 'ul';
      if (nodeChildren != null) {
        for (final dynamic listItem in nodeChildren) {
          if (listItem is Map<String, dynamic> && listItem['type'] == 'listitem') {
            final List<dynamic>? itemChildren = listItem['children'] as List<dynamic>?;
            if (itemChildren != null) {
              for (final dynamic textNode in itemChildren) {
                if (textNode is Map<String, dynamic>) {
                  _processInlineNode(textNode, ops);
                }
              }
            }
            ops.add(<String, dynamic>{
              'insert': '\n',
              'attributes': <String, dynamic>{'block': quillListType},
            });
          }
        }
      }
    }
  }

  static void _processInlineNode(Map<String, dynamic> node, List<Map<String, dynamic>> ops) {
    final String? type = node['type'] as String?;
    if (type == 'text') {
      final String text = node['text'] as String? ?? '';
      if (text.isEmpty) return;

      final int format = node['format'] as int? ?? 0;
      final Map<String, dynamic> attributes = <String, dynamic>{};

      if ((format & 1) != 0) attributes['b'] = true;
      if ((format & 2) != 0) attributes['i'] = true;
      if ((format & 4) != 0) attributes['s'] = true;
      if ((format & 8) != 0) attributes['u'] = true;
      if ((format & 16) != 0) attributes['c'] = true;

      if (attributes.isNotEmpty) {
        ops.add(<String, dynamic>{'insert': text, 'attributes': attributes});
      } else {
        ops.add(<String, dynamic>{'insert': text});
      }
    }
  }

  static Map<String, dynamic> deltaToLexical(List<dynamic> deltaOps) {
    final List<Map<String, dynamic>> children = [];
    List<Map<String, dynamic>> currentLineOps = [];

    final List<Map<String, dynamic>> ops = [];
    for (final dynamic op in deltaOps) {
      if (op is Map) {
        ops.add(Map<String, dynamic>.from(op));
      } else if (op is Operation) {
        ops.add(Map<String, dynamic>.from(op.toJson()));
      }
    }

    void addNode(Map<String, dynamic> node) {
      if (node['type'] == 'list') {
        if (children.isNotEmpty && children.last['type'] == 'list' && children.last['listType'] == node['listType']) {
          final List<dynamic> existingItems = children.last['children'] as List<dynamic>;
          final List<dynamic> newItems = node['children'] as List<dynamic>;
          for (int k = 0; k < newItems.length; k++) {
            final Map<String, dynamic> item = newItems[k] as Map<String, dynamic>;
            item['value'] = existingItems.length + k + 1;
          }
          existingItems.addAll(newItems);
          return;
        }
      }
      children.add(node);
    }

    for (final Map<String, dynamic> op in ops) {
      final dynamic insertVal = op['insert'];
      if (insertVal is! String) continue;

      final Map<String, dynamic>? attributes = op['attributes'] as Map<String, dynamic>?;
      final List<String> parts = insertVal.split('\n');
      for (int i = 0; i < parts.length; i++) {
        final String part = parts[i];
        if (part.isNotEmpty) {
          currentLineOps.add(<String, dynamic>{
            'type': 'text',
            'version': 1,
            'text': part,
            'format': _getLexicalFormatBitmask(attributes),
          });
        }

        if (i < parts.length - 1) {
          final Map<String, dynamic> blockNode = _createBlockNode(currentLineOps, attributes);
          addNode(blockNode);
          currentLineOps = [];
        }
      }
    }

    if (currentLineOps.isNotEmpty) {
      addNode(_createBlockNode(currentLineOps, null));
    }

    if (children.isEmpty) {
      children.add(<String, dynamic>{
        'children': <Map<String, dynamic>>[],
        'direction': null,
        'format': '',
        'indent': 0,
        'type': 'paragraph',
        'version': 1,
        'textFormat': 0,
        'textStyle': '',
      });
    }

    String? rootDirection;
    for (final Map<String, dynamic> child in children) {
      if (child['direction'] == 'ltr') {
        rootDirection = 'ltr';
        break;
      }
    }

    return <String, dynamic>{
      'root': <String, dynamic>{
        'children': children,
        'direction': rootDirection,
        'format': '',
        'indent': 0,
        'type': 'root',
        'version': 1,
      },
    };
  }

  static int _getLexicalFormatBitmask(Map<String, dynamic>? attrs) {
    if (attrs == null) return 0;
    int mask = 0;
    if (attrs['b'] == true) mask |= 1;
    if (attrs['i'] == true) mask |= 2;
    if (attrs['s'] == true) mask |= 4;
    if (attrs['u'] == true) mask |= 8;
    if (attrs['c'] == true) mask |= 16;
    return mask;
  }

  static List<Map<String, dynamic>> _postProcessTextNodes(List<Map<String, dynamic>> textNodes, {required bool isListItem}) {
    final List<Map<String, dynamic>> processed = [];
    for (final Map<String, dynamic> node in textNodes) {
      final Map<String, dynamic> copy = Map<String, dynamic>.from(node);
      final int format = copy['format'] as int? ?? 0;

      if (format == 0) {
        copy.remove('format');
      }

      final Map<String, dynamic> ordered = <String, dynamic>{};
      if (isListItem) {
        ordered['detail'] = 0;
        ordered['mode'] = 'normal';
      }
      ordered['text'] = copy['text'];
      if (copy.containsKey('format')) {
        ordered['format'] = copy['format'];
      }
      ordered['type'] = copy['type'];
      ordered['version'] = copy['version'];
      processed.add(ordered);
    }
    return processed;
  }

  static Map<String, dynamic> _createBlockNode(List<Map<String, dynamic>> textNodes, Map<String, dynamic>? blockAttrs) {
    if (blockAttrs != null) {
      if (blockAttrs['heading'] != null) {
        final dynamic level = blockAttrs['heading'];
        final List<Map<String, dynamic>> processedTextNodes = _postProcessTextNodes(textNodes, isListItem: false);
        return <String, dynamic>{
          'children': processedTextNodes,
          'direction': textNodes.isNotEmpty ? 'ltr' : null,
          'format': '',
          'indent': 0,
          'type': 'heading',
          'version': 1,
          'tag': 'h$level',
        };
      } else if (blockAttrs['block'] != null) {
        final String listVal = blockAttrs['block'] as String;
        final String listType = listVal == 'ol' ? 'number' : 'bullet';
        final String tag = listVal == 'ol' ? 'ol' : 'ul';
        final List<Map<String, dynamic>> processedTextNodes = _postProcessTextNodes(textNodes, isListItem: true);
        return <String, dynamic>{
          'children': <Map<String, dynamic>>[
            <String, dynamic>{
              'children': processedTextNodes,
              'direction': null,
              'format': '',
              'indent': 0,
              'type': 'listitem',
              'version': 1,
              'value': 1,
            },
          ],
          'direction': null,
          'format': '',
          'indent': 0,
          'type': 'list',
          'version': 1,
          'listType': listType,
          'start': 1,
          'tag': tag,
        };
      }
    }

    final List<Map<String, dynamic>> processedTextNodes = _postProcessTextNodes(textNodes, isListItem: false);
    final Map<String, dynamic> paragraphNode = <String, dynamic>{
      'children': processedTextNodes,
      'direction': textNodes.isNotEmpty ? 'ltr' : null,
      'format': '',
      'indent': 0,
      'type': 'paragraph',
      'version': 1,
    };
    if (textNodes.isEmpty) {
      paragraphNode['textFormat'] = 0;
      paragraphNode['textStyle'] = '';
    }
    return paragraphNode;
  }
}
