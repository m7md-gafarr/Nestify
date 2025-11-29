import 'dart:developer';

import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/home/logic/room_category/room_category_cubit.dart';
import 'package:depi_graduation_project/features/home/widgets/category_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late String categoryId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryId = ModalRoute.of(context)!.settings.arguments as String;

      context.read<RoomCategoryCubit>().listenToRoomCategories(
        roomId: categoryId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Living room'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for furniture",
                  prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                ),
              ),
              SizedBox(height: 15.h),
              CustomSectionHeaderWidget(title: 'categories'),

              BlocBuilder<RoomCategoryCubit, RoomCategoryState>(
                builder: (context, state) {
                  if (state is RoomCategoryLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is RoomCategorySucess) {
                    final categories = state.roomCategories;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryListTileWidget(
                          categoryName: category.name,
                          imageAsset: category.imageUrl,
                          categoryId: category.id,
                        );
                      },
                    );
                  } else if (state is RoomCategoryError) {
                    log('Error loading room categories: ${state.message}');
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
