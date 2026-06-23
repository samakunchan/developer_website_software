extension StringExtension on String {
  ///  Transform a text into a slug.
  String slugify() => toLowerCase()
      .trim()
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .replaceAll(RegExp(r'\s+'), '-')
      .replaceAll(RegExp('-+'), '-')
      .replaceAll(RegExp('^-+'), '')
      .replaceAll(RegExp(r'-+$'), '');
}
