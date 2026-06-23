import 'package:flutter/cupertino.dart';

class CupertinoLabeledTextFormFieldRow extends StatelessWidget {
  const CupertinoLabeledTextFormFieldRow({
    required this.label,
    this.controller,
    this.placeholder,
    this.readOnly = false,
    this.enabled,
    this.style,
    this.maxLines,
    this.keyboardType,
    this.validator,
    this.onChanged,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? placeholder;
  final bool readOnly;
  final bool? enabled;
  final TextStyle? style;
  final int? maxLines;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      controller: controller,
      prefix: SizedBox(width: 120, child: Text(label)),
      placeholder: placeholder,
      readOnly: readOnly,
      enabled: enabled,
      style: style,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

class CupertinoLabeledFormRow extends StatelessWidget {
  const CupertinoLabeledFormRow({required this.label, required this.child, this.helper, this.error, super.key});

  final String label;
  final Widget child;
  final Widget? helper;
  final Widget? error;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: SizedBox(width: 120, child: Text(label)),
      helper: helper,
      error: error,
      child: child,
    );
  }
}
