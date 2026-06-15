import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/themes/presentation/input_decoration_theme.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class DWSTextField extends PlatformWidget {
  const DWSTextField({
    required this.controller,
    required this.placeholder,
    required this.childForIcon,
    required this.title,
    this.keyboardType,
    this.obscureText = false,
    super.key,
  });
  final TextEditingController controller;
  final String placeholder;
  final Widget childForIcon;
  final TextInputType? keyboardType;
  final String title;
  final bool obscureText;

  @override
  Widget buildCupertino(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        /// Label
        Text(title),

        /// Textfield
        CupertinoTextField(
          controller: controller,
          placeholder: placeholder,
          keyboardType: keyboardType,
          decoration: kCupertinoInputDecoration,
          obscureText: obscureText,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: childForIcon,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        /// Label
        Text(title),

        /// Textfield
        fluent.InfoLabel(
          label: 'Email Address',
          child: fluent.TextBox(
            controller: controller,
            placeholder: placeholder,
            keyboardType: keyboardType,
            obscureText: obscureText,
            prefix: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: childForIcon,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        /// Textfield
        material.TextField(
          controller: controller,
          decoration: material.InputDecoration(
            labelText: title,
            hintText: placeholder,
            prefixIcon: childForIcon,
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
