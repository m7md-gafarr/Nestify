import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/features/bag/widgets/empty_bag_content.dart';

class BagEmptyView extends StatelessWidget {
  final VoidCallback onStartShopping;

  const BagEmptyView({super.key, required this.onStartShopping});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          CustomSectionHeaderWidget(title: 'bag'),
          Expanded(child: Center(child: const EmptyBagContent())),
          ElevatedButton(
            onPressed: onStartShopping,
            child: Text("Start shopping"),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
