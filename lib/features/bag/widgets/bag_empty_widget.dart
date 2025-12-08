import 'dart:developer';

import 'package:depi_graduation_project/generated/assets.dart';
import 'package:depi_graduation_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BagEmptyWidget extends StatelessWidget {
  const BagEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: Column(
        children: [
          const Spacer(),

          SvgPicture.asset(
            Assets.assetsImagesSurprised,
            width: 120.w,
            height: 120.w,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),

          SizedBox(height: 20.h),

          Text(
            'your bag is empty',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),

          Text(
            "items remain in your bag for 1 hour, and then they're moved to your Saved items",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: () {
              mainScreenKey.currentState?.jumpToHome();
            },
            child: const Text("Start shopping"),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
