import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: "About"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nestify', style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Nestify helps you discover and furnish spaces you love with curated rooms, products, and inspiration.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              Text('Our Mission', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Make home styling simple, delightful, and accessible by blending thoughtful design with seamless shopping.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              Text('What You Can Do', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              const _Bullet(
                text: 'Browse curated rooms and categories for inspiration.',
              ),
              const _Bullet(
                text: 'Save items you love and build your bag effortlessly.',
              ),
              const _Bullet(
                text:
                    'Manage your profile, addresses, and orders from one place.',
              ),
              const SizedBox(height: 20),

              Text('Contact', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Have feedback or need help? Reach us at support@nesti-fy.app.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),

              Text('Version 1.0.0', style: textTheme.bodySmall),
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
