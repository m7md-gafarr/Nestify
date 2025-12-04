import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_light.dart';

class DeliveryAddressCard extends StatelessWidget {
  final String address;
  final String contactInfo;
  final VoidCallback onTap;

  const DeliveryAddressCard({
    super.key,
    required this.address,
    required this.contactInfo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColorLight.iconPrimary,
              size: 26.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address, style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: 4.h),
                  Text(
                    contactInfo,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColorLight.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: AppColorLight.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
