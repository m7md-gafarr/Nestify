import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_state.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/filter_option_selector_sheet.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/filter_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showMainFilterSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocBuilder<FilterAndSortCubit, FilterAndSortState>(
        builder: (context, state) {
          final cubit = context.read<FilterAndSortCubit>();

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter by",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      onPressed: cubit.clearFilters,
                      child: const Text(
                        "Clear",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${state.priceRange.start.round()}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "\$${state.priceRange.end.round()}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                RangeSlider(
                  values: state.priceRange,
                  min: state.minPrice,
                  max: state.maxPrice,
                  divisions: (state.maxPrice - state.minPrice).round(),
                  labels: RangeLabels(
                    '\$${state.priceRange.start.round()}',
                    '\$${state.priceRange.end.round()}',
                  ),
                  onChanged: (range) => cubit.updatePriceRange(range),
                ),
                FilterOptionTile(
                  title: "Product type",
                  selectedValue: state.productType,
                  onTap: () {
                    showFilterOptionSelectorSheet(
                      context: context,
                      title: "Select Product Type",
                      options: [
                        "All",
                        "Chair",
                        "Table",
                        "Sofa",
                        "Bed",
                        "Cabinet",
                        "Desk",
                      ],
                      selectedOption: state.productType,
                      onOptionSelected: cubit.changeProductType,
                    );
                  },
                ),
                FilterOptionTile(
                  title: "Color",
                  selectedValue: state.color,
                  onTap: () {
                    showFilterOptionSelectorSheet(
                      context: context,
                      title: "Select Color",
                      options: [
                        "All",
                        "White",
                        "Black",
                        "Brown",
                        "Gray",
                        "Beige",
                        "Blue",
                      ],
                      selectedOption: state.color,
                      onOptionSelected: cubit.changeColor,
                    );
                  },
                ),
                FilterOptionTile(
                  title: "Size",
                  selectedValue: state.size,
                  onTap: () {
                    showFilterOptionSelectorSheet(
                      context: context,
                      title: "Select Size",
                      options: [
                        "All",
                        "Small",
                        "Medium",
                        "Large",
                        "Extra Large",
                      ],
                      selectedOption: state.size,
                      onOptionSelected: cubit.changeSize,
                    );
                  },
                ),
                FilterOptionTile(
                  title: "Quality",
                  selectedValue: state.quality,
                  onTap: () {
                    showFilterOptionSelectorSheet(
                      context: context,
                      title: "Select Quality",
                      options: ["All", "Premium", "High", "Standard", "Budget"],
                      selectedOption: state.quality,
                      onOptionSelected: cubit.changeQuality,
                    );
                  },
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
