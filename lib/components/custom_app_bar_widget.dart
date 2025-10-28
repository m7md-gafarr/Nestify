import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      centerTitle: true,
      elevation: 0,
      leading:
          leading ??
          IconButton(
            icon: isRTL(context)
                ? const Icon(Iconsax.arrow_right_2)
                : Icon(Iconsax.arrow_left, size: 27.sp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
