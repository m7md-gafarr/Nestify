import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  StreamSubscription<List<ProductModel>>? _subscription;

  ProductCubit() : super(ProductLoading());

  void listenToProducts(String categoryId) {
    _subscription?.cancel();

    emit(ProductLoading());

    _subscription = ProductService()
        .getProductsByCategoryStream(categoryId)
        .listen(
          (products) {
            emit(ProductSuccess(products));
          },
          onError: (error) {
            emit(ProductError('Failed to load products: $error'));
          },
        );
  }

  Future<void> uploadProducts(ProductModel product) async {
    try {
      await ProductService().addProductsByCategoryWithId(product);
      emit(ProductUploaded());
      listenToProducts(product.categoryId);
    } on Exception catch (e) {
      emit(ProductError('Failed to upload product: $e'));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
