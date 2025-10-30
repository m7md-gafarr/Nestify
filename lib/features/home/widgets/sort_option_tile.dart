import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const SortOptionTile({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
      ),
      onTap: onTap,
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              size: 25.sp,
              color: Theme.of(context).primaryColor,
            )
          : Container(
              width: 22.sp,
              height: 22.sp,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor.withOpacity(.5),
                borderRadius: BorderRadius.all(Radius.circular(11.sp)),
              ),
            ),
    );
  }
}
