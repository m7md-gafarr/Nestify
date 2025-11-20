import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SavedItemsEmptyScreen extends StatelessWidget {
  const SavedItemsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: CustomSectionHeaderWidget(title: 'saved items'),
              ),

              Spacer(),
              SvgPicture.asset(
                Assets.assetsImagesSurprised,
                width: 120.w,
                height: 120.w,
              ),
              Text(
                'nothing saved...',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                '... no worries. Start saving as you shop by clicking the little heart',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              ElevatedButton(onPressed: () {}, child: Text("Start shopping")),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
