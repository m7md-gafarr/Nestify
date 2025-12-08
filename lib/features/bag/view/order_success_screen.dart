import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/images/app_images.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(height: 60.h),

          Text("#${orderId ?? ''}"),
          Spacer(flex: 2),

          SvgPicture.asset(
            Assets.assetsFriendly,
            width: 160.w,
            height: 160.w,
            fit: BoxFit.cover,
          ),
          Text(
            "your order is placed",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w),
            child: Text(
              "thanks for your order, we hope you enjoyed shopping with us",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 16.sp),
            ),
          ),
          Spacer(flex: 2),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 2),
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouteNames.mainScreenRoute,
                (route) => false,
              ),
              child: Text("To home"),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
