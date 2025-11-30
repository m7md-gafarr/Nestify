import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  StreamSubscription<List<ProductModel>>? _subscription;

  ProductCubit() : super(ProductLoading());

  void listenToProducts(String categoryId) {
    emit(ProductLoading());

    _subscription = ProductService()
        .getProductsByCategoryStream(categoryId)
        .listen(
          (products) {
            log('Products loaded: ${products.length}');
            emit(ProductSuccess(products));
          },
          onError: (error) {
            emit(ProductError('Failed to load products: $error'));
          },
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
