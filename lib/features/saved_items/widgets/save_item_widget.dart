import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveItemWidget extends StatelessWidget {
  const SaveItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              Assets.assetsImagesPic,
              width: 96.w,
              height: 115.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '\$150.00',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.close, size: 16),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Wooden bedside table featuring a raised design",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(fixedSize: Size(130.w, 36.h)),
                  child: Text("Move to bag", textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
