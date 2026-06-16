import 'package:fluent_ui/fluent_ui.dart';

class FluentAuthenticationTextField extends StatelessWidget {
  const FluentAuthenticationTextField({
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
        InfoLabel(
          label: 'Email Address',
          child: TextBox(
            controller: controller,
            placeholder: placeholder,
            keyboardType: keyboardType,
            obscureText: obscureText,
            prefix: Padding(
              padding: const .symmetric(horizontal: 8),
              child: childForIcon
            )
          )
        )
      ]
    );
  }
}
