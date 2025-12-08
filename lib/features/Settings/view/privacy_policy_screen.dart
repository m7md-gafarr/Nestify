import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Privacy Policy"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Introduction', style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'We value your privacy and are committed to protecting your personal information. This policy explains what data we collect, how we use it, and your choices.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              Text('Information We Collect', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'Account details you provide such as name, email, and phone number.',
              ),
              _Bullet(
                text:
                    'Usage data like app interactions, device info, and crash logs.',
              ),
              _Bullet(
                text:
                    'Optional inputs you share such as addresses and saved items.',
              ),
              const SizedBox(height: 20),

              Text('How We Use Information', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'To provide and improve app features, including personalization.',
              ),
              _Bullet(
                text:
                    'To process orders, payments, and customer support requests.',
              ),
              _Bullet(
                text:
                    'To maintain security, prevent fraud, and comply with legal requirements.',
              ),
              const SizedBox(height: 20),

              Text('Sharing and Disclosure', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(text: 'We do not sell your personal data.'),
              _Bullet(
                text:
                    'We may share data with service providers (e.g., payments, analytics, cloud storage) under strict confidentiality.',
              ),
              _Bullet(
                text:
                    'We may disclose information if required by law or to protect rights and safety.',
              ),
              const SizedBox(height: 20),

              Text('Your Choices', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'Update or delete your account data through account settings where available.',
              ),
              _Bullet(text: 'Control notifications from system settings.'),
              _Bullet(
                text:
                    'You may withdraw consent for optional permissions at any time.',
              ),
              const SizedBox(height: 20),

              Text('Data Security and Retention', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'We use reasonable safeguards to protect data in transit and at rest.',
              ),
              _Bullet(
                text:
                    'We retain data only as long as necessary for the purposes described or as required by law.',
              ),
              const SizedBox(height: 20),

              Text('Contact Us', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'If you have questions or requests about this policy, contact support@nesti-fy.app.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),

              Text('Last updated: Dec 2025', style: textTheme.bodySmall),
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
