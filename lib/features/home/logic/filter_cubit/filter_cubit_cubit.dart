import 'package:depi_graduation_project/features/home/logic/filter_cubit/filter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void changePrice(RangeValues range) =>
      emit(state.copyWith(priceRange: range));

  void changeProductType(String type) =>
      emit(state.copyWith(productType: type));

  void changeColor(String color) => emit(state.copyWith(color: color));

  void changeSize(String size) => emit(state.copyWith(size: size));

  void changeQuality(String quality) => emit(state.copyWith(quality: quality));

  void clearFilters() => emit(const FilterState());
}
