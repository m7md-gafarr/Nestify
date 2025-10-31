import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.w,
      height: 32.w,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
        child: Icon(icon, size: 18.sp),
      ),
    );
  }
}


