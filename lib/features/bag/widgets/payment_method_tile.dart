import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_light.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isSelected;
  final Widget leading;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.isSelected,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected
                ? AppColorLight.buttonPrimary
                : AppColorLight.border,
          ),
        ),
        child: Row(
          children: [
            leading,
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColorLight.textSecondary,
                          ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColorLight.buttonPrimary
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColorLight.buttonPrimary
                      : AppColorLight.border,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 14.sp,
                      color: AppColorLight.onButtonPrimary,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}


