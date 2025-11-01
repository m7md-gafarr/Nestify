import 'package:flutter/material.dart';

class CustomSectionHeaderWidget extends StatelessWidget {
  const CustomSectionHeaderWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(letterSpacing: 1),
      ),
    );
  }
}
