import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/images/app_images.dart';
import '../../../core/theme/app_color/app_color_light.dart';

class OrderSuccessScreen extends StatelessWidget {

  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorLight.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),

          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.assetsFriendly,
                    width: 160.w,
                    height: 160.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "your order is placed",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Text(
                      "thanks for your order, we hope you enjoyed shopping with us",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                side:  BorderSide(color: Colors.black, width: 2),
              ),
              onPressed: () => Navigator.of(context).pushNamed("/homePageRoute") ,
              child: Text("To my orders"),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
