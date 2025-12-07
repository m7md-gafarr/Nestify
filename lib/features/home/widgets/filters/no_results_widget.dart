import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.search_status, size: 60.sp),
          SizedBox(height: 10.h),
          Text(
            message,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
