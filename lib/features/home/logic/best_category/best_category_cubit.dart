import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/best_category_service.dart';
import 'package:depi_graduation_project/features/home/models/categories/best_categories_model.dart';
import 'package:meta/meta.dart';

part 'best_category_state.dart';

class BestCategoryCubit extends Cubit<BestCategoryState> {
  final BestCategoryService service;
  StreamSubscription? _subscription;

  BestCategoryCubit({required this.service}) : super(BestCategoryLoading());

  void listenToBestCategories() {
    emit(BestCategoryLoading());

    _subscription?.cancel();

    _subscription = service.getBestCategoriesStream().listen(
      (bestCategories) {
        emit(BestCategorySuccess(bestCategories));
      },
      onError: (error) {
        emit(BestCategoryError('Failed to load best categories: $error'));
      },
    );
  }

  Future<void> addBestCategory(BestCategoryModel model) async {
    try {
      await service.addBestCategoryWithId(model);
      emit(BestCategoryAdded());
      listenToBestCategories();
    } catch (e) {
      emit(BestCategoryError('Failed to add best category: $e'));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
