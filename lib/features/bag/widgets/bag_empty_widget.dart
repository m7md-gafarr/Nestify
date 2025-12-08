import 'package:depi_graduation_project/generated/assets.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
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
            S.of(context).bagEmpty,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),

          Text(
            S.of(context).bagEmptyMessage,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: () {
              mainScreenKey.currentState?.jumpToHome();
            },
            child: Text(S.of(context).bagEmptyStartShopping),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
