import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),

          SvgPicture.asset(
            Assets.assetsImagesDissatisfied,
            width: 120.w,
            height: 120.w,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            S.of(context).noResultsMessage,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
