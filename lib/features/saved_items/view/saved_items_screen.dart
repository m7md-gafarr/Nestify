import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:depi_graduation_project/features/saved_items/widgets/saved_items_empty_widget.dart';
import 'package:depi_graduation_project/features/saved_items/widgets/save_item_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<SavedItemsCubit>().loadSavedItems(
            FirebaseAuth.instance.currentUser!.uid,
          );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                CustomSectionHeaderWidget(title: 'saved items'),
                SizedBox(height: 20.h),
                BlocBuilder<SavedItemsCubit, SavedItemsState>(
                  builder: (context, state) {
                    if (state is SavedItemsLoaded &&
                        state.savedItems.isNotEmpty) {
                      return TextField(
                        decoration: InputDecoration(
                          hintText: "Search for furniture",
                          prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 15.h),
                BlocBuilder<SavedItemsCubit, SavedItemsState>(
                  builder: (context, state) {
                    if (state is SavedItemsLoaded) {
                      if (state.savedItems.isEmpty) {
                        return SavedItemsEmptyWidget();
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SaveItemWidget(
                              productModel: state.savedItems[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.h),
                          itemCount: state.savedItems.length,
                        );
                      }
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
