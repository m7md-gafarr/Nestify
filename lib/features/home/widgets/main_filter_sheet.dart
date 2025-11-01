import 'package:depi_graduation_project/features/home/widgets/filter_option_selector_sheet.dart';
import 'package:depi_graduation_project/features/home/widgets/filter_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showMainFilterSheet({
  required BuildContext context,
  required RangeValues priceRange,
  required String selectedProductType,
  required String selectedColor,
  required String selectedSize,
  required String selectedQuality,
  required Function(RangeValues) onPriceRangeChanged,
  required Function() onClearFilters,
  required Function(String) onProductTypeSelected,
  required Function(String) onColorSelected,
  required Function(String) onSizeSelected,
  required Function(String) onQualitySelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return SizedBox(
            height: 650.h,
            width: double.infinity,
            child: Padding(
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
                        onPressed: () {
                          setModalState(() {
                            onClearFilters();
                          });
                        },
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
                        "\$${priceRange.start.round()}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        "\$${priceRange.end.round()}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: priceRange,
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    labels: RangeLabels(
                      '\$${priceRange.start.round()}',
                      '\$${priceRange.end.round()}',
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        onPriceRangeChanged(values);
                      });
                    },
                  ),
                  FilterOptionTile(
                    title: "Product type",
                    selectedValue: selectedProductType,
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
                        selectedOption: selectedProductType,
                        onOptionSelected: (option) {
                          setModalState(() {
                            onProductTypeSelected(option);
                          });
                        },
                      );
                    },
                  ),
                  FilterOptionTile(
                    title: "Color",
                    selectedValue: selectedColor,
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
                        selectedOption: selectedColor,
                        onOptionSelected: (option) {
                          setModalState(() {
                            onColorSelected(option);
                          });
                        },
                      );
                    },
                  ),
                  FilterOptionTile(
                    title: "Size",
                    selectedValue: selectedSize,
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
                        selectedOption: selectedSize,
                        onOptionSelected: (option) {
                          setModalState(() {
                            onSizeSelected(option);
                          });
                        },
                      );
                    },
                  ),
                  FilterOptionTile(
                    title: "Quality",
                    selectedValue: selectedQuality,
                    onTap: () {
                      showFilterOptionSelectorSheet(
                        context: context,
                        title: "Select Quality",
                        options: [
                          "All",
                          "Premium",
                          "High",
                          "Standard",
                          "Budget",
                        ],
                        selectedOption: selectedQuality,
                        onOptionSelected: (option) {
                          setModalState(() {
                            onQualitySelected(option);
                          });
                        },
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
            ),
          );
        },
      );
    },
  );
}
