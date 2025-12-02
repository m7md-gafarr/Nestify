import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/main_filter_sheet.dart';
import 'package:depi_graduation_project/features/home/widgets/sorting/sort_bottom_sheet.dart';
import 'package:depi_graduation_project/features/saved_items/widgets/save_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  int selectedSortIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              CustomSectionHeaderWidget(title: 'saved items'),
              SizedBox(height: 20.h),

              TextField(
                decoration: InputDecoration(
                  hintText: "Search for furniture",
                  prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showSortBottomSheet(context: context);
                      },
                      icon: const Icon(Iconsax.sort),
                      label: const Text("Sort"),
                      style: Theme.of(context).outlinedButtonTheme.style
                          ?.copyWith(
                            fixedSize: WidgetStateProperty.all<Size>(
                              Size(150.w, 30.h),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showMainFilterSheet(context: context);
                      },
                      icon: const Icon(Iconsax.filter),
                      label: const Text("Filter"),
                      style: Theme.of(context).outlinedButtonTheme.style
                          ?.copyWith(
                            fixedSize: WidgetStateProperty.all<Size>(
                              Size(150.w, 30.h),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => SizedBox(height: 16.h),
                itemBuilder: (_, i) {
                  return SaveItemWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
