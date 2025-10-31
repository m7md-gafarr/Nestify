import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/features/bag/widgets/empty_bag_content.dart';

import '../../../components/primary_button.dart';

class BagEmptyView extends StatelessWidget {
  final VoidCallback onStartShopping;

  const BagEmptyView({super.key, required this.onStartShopping});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 36.h, 16.w, 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('bag', style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 40.h),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const EmptyBagContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        label: 'Start shopping',
        onPressed: onStartShopping,
      ),
    );
  }
}
