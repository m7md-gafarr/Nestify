import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: S.of(context).aboutTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).aboutAppName, style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(S.of(context).aboutAppDesc, style: textTheme.bodyMedium),
              const SizedBox(height: 20),

              Text(
                S.of(context).aboutMissionTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(S.of(context).aboutMissionBody, style: textTheme.bodyMedium),
              const SizedBox(height: 20),

              Text(
                S.of(context).aboutWhatYouCanDoTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(text: S.of(context).aboutWhatYouCanDoItem1),
              _Bullet(text: S.of(context).aboutWhatYouCanDoItem2),
              _Bullet(text: S.of(context).aboutWhatYouCanDoItem3),
              const SizedBox(height: 20),

              Text(
                S.of(context).aboutContactTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(S.of(context).aboutContactBody, style: textTheme.bodyMedium),
              const SizedBox(height: 30),

              Text(S.of(context).aboutVersion, style: textTheme.bodySmall),
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
