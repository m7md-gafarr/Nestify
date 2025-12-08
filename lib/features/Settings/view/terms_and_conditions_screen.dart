import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Terms & Conditions"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to Nestify', style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'By using our app, you agree to these terms. Please read them carefully.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              Text('Use of the App', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'You must be at least 18 years old or have guardian consent.',
              ),
              _Bullet(
                text:
                    'Provide accurate account information and keep credentials secure.',
              ),
              _Bullet(
                text:
                    'Use the app only for lawful purposes and in accordance with these terms.',
              ),
              const SizedBox(height: 20),

              Text('Orders and Payments', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'Prices, fees, and availability may change without notice.',
              ),
              _Bullet(
                text:
                    'You authorize us to charge your selected payment method for purchases.',
              ),
              _Bullet(
                text:
                    'Promotions and discount codes may have additional conditions.',
              ),
              const SizedBox(height: 20),

              Text(
                'Content and Intellectual Property',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'All app content is owned by us or our licensors and protected by law.',
              ),
              _Bullet(
                text:
                    'You may not copy, modify, or distribute content without permission.',
              ),
              _Bullet(
                text:
                    'User-submitted content must not infringe others’ rights or be unlawful.',
              ),
              const SizedBox(height: 20),

              Text('Prohibited Conduct', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'No attempts to hack, disrupt, or reverse-engineer the app.',
              ),
              _Bullet(
                text:
                    'No harassment, fraud, or abusive behavior toward others.',
              ),
              _Bullet(
                text: 'No misuse of promotions, referrals, or return policies.',
              ),
              const SizedBox(height: 20),

              Text('Liability', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'The app is provided “as is” without warranties of any kind to the maximum extent permitted by law.',
              ),
              _Bullet(
                text:
                    'We are not liable for indirect, incidental, or consequential damages.',
              ),
              _Bullet(
                text:
                    'Your sole remedy for dissatisfaction is to stop using the app.',
              ),
              const SizedBox(height: 20),

              Text('Termination', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              _Bullet(
                text:
                    'We may suspend or terminate access for violations of these terms or unlawful activity.',
              ),
              _Bullet(
                text:
                    'You may stop using the app at any time; certain obligations may survive termination.',
              ),
              const SizedBox(height: 20),

              Text('Changes to These Terms', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'We may update these terms periodically. Continued use after changes means you accept the updated terms.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              Text('Contact Us', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Questions about these terms? Contact support@nesti-fy.app.',
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
