import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_state.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/main_filter_sheet.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/no_results_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/products/product_grid_item.dart';
import 'package:depi_graduation_project/features/home/widgets/products/shimmer/product_grid_item_shimmer.dart';
import 'package:depi_graduation_project/features/home/widgets/sorting/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late String categoryId;
  List<ProductModel> originalProducts = [];
  List<ProductModel> visibleProducts = [];
  String searchQuery = "";
  bool pricesInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryId =
          (ModalRoute.of(context)!.settings.arguments as List<dynamic>)[0];
      context.read<ProductCubit>().listenToProducts(categoryId);
    });
  }

  void applyFiltersAndSort(FilterAndSortState filter) {
    List<ProductModel> temp = List.from(originalProducts);

    if (searchQuery.isNotEmpty) {
      temp = temp.where((p) {
        return p.name.toLowerCase().contains(searchQuery) ||
            p.description.toLowerCase().contains(searchQuery);
      }).toList();
    }

    temp = temp
        .where(
          (p) =>
              p.price >= filter.priceRange.start &&
              p.price <= filter.priceRange.end,
        )
        .toList();

    if (filter.productType != "All") {
      temp = temp.where((p) => p.productType == filter.productType).toList();
    }

    if (filter.color != "All") {
      temp = temp
          .where(
            (p) => p.colors.any(
              (c) => c.name.toLowerCase() == filter.color.toLowerCase(),
            ),
          )
          .toList();
    }

    if (filter.size != "All") {
      temp = temp.where((p) => p.size == filter.size).toList();
    }

    if (filter.quality != "All") {
      temp = temp.where((p) => p.quality == filter.quality).toList();
    }

    switch (filter.sortOption) {
      case 0:
        temp.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 1:
        temp.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 2:
        temp.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }

    visibleProducts = temp;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTitle =
        (ModalRoute.of(context)!.settings.arguments as List<dynamic>)[1];

    return Scaffold(
      appBar: CustomAppBarWidget(title: categoryTitle),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductCubit>().listenToProducts(categoryId);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: 30.h),

              TextField(
                onChanged: (value) {
                  searchQuery = value.toLowerCase();
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Search for furniture",
                  prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                ),
              ),

              SizedBox(height: 15.h),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => showSortBottomSheet(context: context),
                      icon: const Icon(Iconsax.sort),
                      label: const Text("Sort"),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => showMainFilterSheet(context: context),
                      icon: const Icon(Iconsax.filter),
                      label: const Text("Filter"),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, productState) {
                    if (productState is! ProductSuccess) {
                      return GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.55,
                            ),
                        itemBuilder: (_, __) => ProductGridItemShimmer(),
                      );
                    }

                    originalProducts = productState.products;
                    if (!pricesInitialized) {
                      final maxPrice = originalProducts
                          .map((p) => p.price)
                          .reduce((a, b) => a > b ? a : b);
                      final minPrice = originalProducts
                          .map((p) => p.price)
                          .reduce((a, b) => a < b ? a : b);

                      context.read<FilterAndSortCubit>().setMinMax(
                        minPrice,
                        maxPrice,
                      );
                      pricesInitialized = true;
                    }

                    return BlocBuilder<FilterAndSortCubit, FilterAndSortState>(
                      builder: (context, filterState) {
                        applyFiltersAndSort(filterState);

                        if (visibleProducts.isEmpty) {
                          return NoResultsWidget(message: "No products found");
                        }

                        return GridView.builder(
                          itemCount: visibleProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.55,
                              ),
                          itemBuilder: (context, index) {
                            return ProductGridItem(
                              product: visibleProducts[index],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
