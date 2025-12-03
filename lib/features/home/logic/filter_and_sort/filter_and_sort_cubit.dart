import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAndSortCubit extends Cubit<FilterAndSortState> {
  FilterAndSortCubit() : super(const FilterAndSortState());

  void changeSortOption(int option) => emit(state.copyWith(sortOption: option));

  void changeProductType(String type) =>
      emit(state.copyWith(productType: type));

  void changeColor(String color) => emit(state.copyWith(color: color));

  void changeSize(String size) => emit(state.copyWith(size: size));

  void changeQuality(String quality) => emit(state.copyWith(quality: quality));

  void updatePriceRange(RangeValues values) {
    emit(state.copyWith(priceRange: values));
  }

  void setMinMax(double min, double max) {
    emit(
      state.copyWith(
        priceRange: RangeValues(min, max),
        minPrice: min,
        maxPrice: max,
      ),
    );
  }

  void clearFilters() {
    emit(
      state.copyWith(
        productType: "All",
        color: "All",
        size: "All",
        quality: "All",
        priceRange: RangeValues(state.minPrice, state.maxPrice),
      ),
    );
  }
}
