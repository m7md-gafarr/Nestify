import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: S.of(context).privacyPolicyTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).privacyIntroTitle,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(S.of(context).privacyIntroBody, style: textTheme.bodyMedium),
              const SizedBox(height: 20),

              Text(
                S.of(context).privacyInfoCollectTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).privacyInfoCollectItem1),
              _Bullet(text: S.of(context).privacyInfoCollectItem2),
              _Bullet(text: S.of(context).privacyInfoCollectItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).privacyUseInfoTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).privacyUseInfoItem1),
              _Bullet(text: S.of(context).privacyUseInfoItem2),
              _Bullet(text: S.of(context).privacyUseInfoItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).privacySharingTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).privacySharingItem1),
              _Bullet(text: S.of(context).privacySharingItem2),
              _Bullet(text: S.of(context).privacySharingItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).privacyChoicesTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).privacyChoicesItem1),
              _Bullet(text: S.of(context).privacyChoicesItem2),
              _Bullet(text: S.of(context).privacyChoicesItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).privacySecurityTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).privacySecurityItem1),
              _Bullet(text: S.of(context).privacySecurityItem2),
              const SizedBox(height: 20),

              Text(
                S.of(context).privacyContactTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).privacyContactBody,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),

              Text(
                S.of(context).privacyLastUpdated,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(child: Text(text, style: textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
