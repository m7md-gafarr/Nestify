import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: S.of(context).termsTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).termsWelcomeTitle,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(S.of(context).termsWelcomeBody, style: textTheme.bodyMedium),
              const SizedBox(height: 20),

              Text(S.of(context).termsUseTitle, style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).termsUseItem1),
              _Bullet(text: S.of(context).termsUseItem2),
              _Bullet(text: S.of(context).termsUseItem3),
              const SizedBox(height: 20),

              Text(S.of(context).termsOrdersTitle, style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).termsOrdersItem1),
              _Bullet(text: S.of(context).termsOrdersItem2),
              _Bullet(text: S.of(context).termsOrdersItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).termsContentTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).termsContentItem1),
              _Bullet(text: S.of(context).termsContentItem2),
              _Bullet(text: S.of(context).termsContentItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).termsProhibitedTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).termsProhibitedItem1),
              _Bullet(text: S.of(context).termsProhibitedItem2),
              _Bullet(text: S.of(context).termsProhibitedItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).termsLiabilityTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).termsLiabilityItem1),
              _Bullet(text: S.of(context).termsLiabilityItem2),
              _Bullet(text: S.of(context).termsLiabilityItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).termsTerminationTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).termsTerminationItem1),
              _Bullet(text: S.of(context).termsTerminationItem2),
              const SizedBox(height: 20),

              Text(
                S.of(context).termsChangesTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(S.of(context).termsChangesBody, style: textTheme.bodyMedium),
              const SizedBox(height: 20),

              Text(
                S.of(context).termsContactTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(S.of(context).termsContactBody, style: textTheme.bodyMedium),
              const SizedBox(height: 30),

              Text(S.of(context).termsLastUpdated, style: textTheme.bodySmall),
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
