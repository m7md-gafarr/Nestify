import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/data/services/saved_item_service/saved_item_service.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/features/saved_items/models/saved_item_model.dart';
import 'package:meta/meta.dart';

part 'saved_items_state.dart';

class SavedItemsCubit extends Cubit<SavedItemsState> {
  SavedItemsCubit() : super(SavedItemsInitial());

  final SavedItemService _service = SavedItemService();
  StreamSubscription? _subscription;

  void loadSavedItems(String userId) {
    _subscription?.cancel();
    emit(SavedItemsLoading());

    _subscription = _service
        .listenToSavedItems(userId)
        .listen(
          (item) async {
            List<String> ids = item.productId;

            List<ProductModel> products = [];
            for (String id in ids) {
              final product = await ProductService().getProductById(id);
              if (product != null) {
                products.add(product);
              }
            }

            emit(SavedItemsLoaded(products));
          },
          onError: (error) {
            emit(SavedItemsError('Failed to load saved items: $error'));
          },
        );
  }

  Future<void> addSavedItem({
    required String userId,
    required String productId,
  }) async {
    try {
      await _service.addSavedItem(
        userId: userId,
        model: SavedItemModel(productId: [productId]),
      );

      loadSavedItems(userId);
    } catch (e) {
      emit(SavedItemsError(e.toString()));
    }
  }

  Future<void> removeSavedItem({
    required String userId,
    required String productId,
  }) async {
    try {
      await _service.removeSavedItem(
        userId: userId,
        model: SavedItemModel(productId: [productId]),
      );

      loadSavedItems(userId);
    } catch (e) {
      emit(SavedItemsError(e.toString()));
    }
  }

  bool isSaved(String productId, List<ProductModel> products) {
    return products.any((p) => p.id == productId);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
