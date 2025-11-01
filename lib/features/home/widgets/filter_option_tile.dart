import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterOptionTile extends StatelessWidget {
  final String title;
  final String selectedValue;
  final VoidCallback onTap;

  const FilterOptionTile({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onTap,
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
      trailing: Text(
        selectedValue,
        style: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
