import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/home/logic/room_category/room_category_cubit.dart';
import 'package:depi_graduation_project/features/home/widgets/categories/category_list_tile_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/categories/shimmer/category_list_tile_widget_shimmer.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/no_results_widget.dart';
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
  String searchQuery = "";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryId =
          (ModalRoute.of(context)!.settings.arguments as List<dynamic>)[0];

      context.read<RoomCategoryCubit>().listenToRoomCategories(
        roomId: categoryId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryTitle =
        (ModalRoute.of(context)!.settings.arguments as List<dynamic>)[1];
    return Scaffold(
      appBar: CustomAppBarWidget(title: categoryTitle),
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<RoomCategoryCubit>().listenToRoomCategories(
              roomId: categoryId,
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase().trim();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search for categories",
                      prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomSectionHeaderWidget(title: 'categories'),

                  BlocBuilder<RoomCategoryCubit, RoomCategoryState>(
                    builder: (context, state) {
                      if (state is RoomCategorySucess) {
                        final categories = state.roomCategories;

                        final filtered = categories.where((category) {
                          return category.name.toLowerCase().contains(
                            searchQuery,
                          );
                        }).toList();
                        if (filtered.isEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: NoResultsWidget(
                              message: "No categories found",
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final category = filtered[index];
                            return CategoryListTileWidget(
                              categoryName: category.name,
                              imageAsset: category.imageUrl,
                              categoryId: category.id,
                            );
                          },
                        );
                      } else {
                        return Column(
                          children: List.generate(
                            5,
                            (index) => CategoryListTileWidgetShimmer(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
