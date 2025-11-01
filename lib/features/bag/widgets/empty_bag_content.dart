import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/images/app_images.dart';

class EmptyBagContent extends StatelessWidget {
  const EmptyBagContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Assets.assetsSurprisedPic,
          width: 160.w,
          height: 160.w,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 24.h),
        Text(
          'your bag is empty',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 8.h),
        Text(
          "items remain in your bag for 1 hour, and then they're moved to your Saved items",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
