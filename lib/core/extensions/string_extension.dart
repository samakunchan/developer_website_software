import 'package:intl/intl.dart';

extension StringExtension on String {
  ///  Transform a text into a slug.
  String slugify() => toLowerCase()
      .trim()
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .replaceAll(RegExp(r'\s+'), '-')
      .replaceAll(RegExp('-+'), '-')
      .replaceAll(RegExp('^-+'), '')
      .replaceAll(RegExp(r'-+$'), '');

  String formatFullDate() {
    final DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime == null) return '';
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  String formatTime() {
    final DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime == null) return '';
    return DateFormat('HH:mm').format(dateTime);
  }

  String getInitialAvatar() => split(' ').where((s) => s.isNotEmpty).map((s) => s[0]).take(2).join().toUpperCase();
}
