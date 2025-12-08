import 'package:depi_graduation_project/features/home/view/user/main_screen.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:depi_graduation_project/main.dart';
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

          Text("${S.of(context).orderSuccessOrderId}${orderId ?? ''}"),
          Spacer(flex: 2),

          SvgPicture.asset(
            Assets.assetsImagesFriendly,
            width: 160.w,
            height: 160.w,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          Text(
            S.of(context).orderSuccessTitle,
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
              S.of(context).orderSuccessMessage,
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
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MainScreen(key: mainScreenKey),
                  ),
                  (route) => false,
                );
              },
              child: Text(S.of(context).orderSuccessToHome),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
