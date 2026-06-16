import 'package:developer_website_software/features/themes/presentation/input_decoration_theme.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAuthenticationTextField extends StatelessWidget {
  const CupertinoAuthenticationTextField({
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
        /// Label
        Text(title),

        /// Textfield
        CupertinoTextField(
          controller: controller,
          placeholder: placeholder,
          keyboardType: keyboardType,
          decoration: kCupertinoInputDecoration,
          obscureText: obscureText,
          padding: const .symmetric(vertical: 12, horizontal: 10),
          prefix: Padding(
            padding: const .symmetric(horizontal: 8),
            child: childForIcon
          )
        )
      ]
    );
  }
}
