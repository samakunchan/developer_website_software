enum CategoryDisplay {
  web(key: 'web', value: 'Web'),
  mobile(key: 'mobile', value: 'Mobile'),
  openSource(key: 'open_source', value: 'Open Source');

  const CategoryDisplay({required this.key, required this.value});
  final String key;
  final String value;
}

enum StatusDisplay {
  draft(key: 'draft', value: 'Draft'),
  published(key: 'published', value: 'Published'),
  unpublished(key: 'unpublished', value: 'Unpublished'),
  archived(key: 'archived', value: 'Archived');

  const StatusDisplay({required this.key, required this.value});
  final String key;
  final String value;
}
