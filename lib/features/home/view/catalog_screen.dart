import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/widgets/main_filter_sheet.dart';
import 'package:depi_graduation_project/features/home/widgets/product_grid_item.dart';
import 'package:depi_graduation_project/features/home/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int selectedSortIndex = 0;
  late String categoryId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryId = ModalRoute.of(context)!.settings.arguments as String;

      context.read<ProductCubit>().listenToProducts(categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Furniture'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 30.h),
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
                      showSortBottomSheet(
                        context: context,
                        selectedSortIndex: selectedSortIndex,
                        onSortSelected: (index) {
                          setState(() {
                            selectedSortIndex = index;
                          });
                        },
                      );
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

            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is ProductSuccess) {
                  final products = state.products;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.55,
                          ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductGridItem(product: products[index]);
                      },
                    ),
                  );
                } else if (state is ProductError) {
                  return Expanded(child: Center(child: Text(state.message)));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
