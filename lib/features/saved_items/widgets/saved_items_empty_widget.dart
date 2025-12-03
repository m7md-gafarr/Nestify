import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SavedItemsEmptyWidget extends StatelessWidget {
  const SavedItemsEmptyWidget({super.key});

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
          ),

          SizedBox(height: 20.h),

          Text(
            'nothing saved...',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),

          Text(
            '... no worries. Start saving as you shop by clicking the little heart',
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
