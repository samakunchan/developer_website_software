import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/macos/cupertino_authentication_text_field.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/others/material_authentication_text_field.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/windows/fluent_authentication_text_field.dart';
import 'package:flutter/widgets.dart';

class AuthenticationTextField extends PlatformWidget {
  const AuthenticationTextField({
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
  Widget buildCupertino(BuildContext context) {
    return CupertinoAuthenticationTextField(
      controller: controller,
      placeholder: placeholder,
      childForIcon: childForIcon,
      title: title,
      keyboardType: keyboardType,
      obscureText: obscureText
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAuthenticationTextField(
      controller: controller,
      placeholder: placeholder,
      childForIcon: childForIcon,
      title: title,
      keyboardType: keyboardType,
      obscureText: obscureText
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAuthenticationTextField(
      controller: controller,
      placeholder: placeholder,
      childForIcon: childForIcon,
      title: title,
      keyboardType: keyboardType,
      obscureText: obscureText
    );
  }
}
