import 'package:flutter/material.dart';

class MaterialAuthenticationTextField extends StatelessWidget {
  const MaterialAuthenticationTextField({
    required this.controller,
    required this.placeholder,
    required this.childForIcon,
    required this.title,
    this.keyboardType,
    this.obscureText = false,
    super.key
  });

  final TextEditingController controller;
  final String placeholder;
  final Widget childForIcon;
  final TextInputType? keyboardType;
  final String title;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        /// Textfield
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            hintText: placeholder,
            prefixIcon: childForIcon
          ),
          keyboardType: keyboardType,
          obscureText: obscureText
        )
      ]
    );
  }
}
