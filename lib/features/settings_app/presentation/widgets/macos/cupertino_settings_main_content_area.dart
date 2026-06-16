import 'package:flutter/cupertino.dart';

class CupertinoSettingsMainContentArea extends StatelessWidget {
  const CupertinoSettingsMainContentArea({required this.selectedSectionIndex, super.key});

  final int selectedSectionIndex;

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    switch (selectedSectionIndex) {
      case 0:
        return _buildThemesContent(context);
      case 1:
        return _buildLegalMentionsContent(context);
      case 2:
        return _buildCGUContent(context);
      case 3:
        return _buildPrivacyPolicyContent(context);
      case 4:
        return _buildCookiePolicyContent(context);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildThemesContent(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 20,
      children: [
        Text(
          'Themes & Appearance',
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 24, fontWeight: .bold),
        ),
        Text(
          'Choose the interface appearance, font size, and typography that you prefer.',
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        const SizedBox(height: 10),
        const Expanded(child: Center(child: Placeholder())),
      ],
    );
  }

  Widget _buildLegalMentionsContent(BuildContext context) {
    return _buildPolicyTemplate(
      context,
      'Legal Mentions',
      'Legal Mentions outline the ownership, hosting, and contact details of our platform. Under local laws, we specify the publishing entity (PapangueSoft), registered address, hosting provider, and intellectual property rights details here.',
    );
  }

  Widget _buildCGUContent(BuildContext context) {
    return _buildPolicyTemplate(
      context,
      "Conditions Générales d'Utilisation (CGU)",
      'The CGU governs the access and usage terms of this developer website software. By using the system, users agree to comply with standards of acceptable conduct, intellectual property protection, account security responsibilities, and liability limitations.',
    );
  }

  Widget _buildPrivacyPolicyContent(BuildContext context) {
    return _buildPolicyTemplate(
      context,
      'Privacy Policy',
      'The Privacy Policy details how we collect, process, store, and secure user data. We only gather essential metrics required to run developer features. We respect personal data rights under GDPR and CCPA, providing settings to export or erase history.',
    );
  }

  Widget _buildCookiePolicyContent(BuildContext context) {
    return _buildPolicyTemplate(
      context,
      'Cookie Policy',
      'The Cookie Policy details how we utilize cookies and local storage tokens to persist user preferences (such as light/dark mode selection and session authorization). We only use functional and performance-essential cookies.',
    );
  }

  Widget _buildPolicyTemplate(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16,
      children: [
        Text(title, style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 24, fontWeight: .bold)),
        Text('Last updated: June 2026', style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Text(description, style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(height: 1.5)),
          ),
        ),
      ],
    );
  }
}
