import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:meta/meta.dart';

part 'best_product_state.dart';

class BestProductCubit extends Cubit<BestProductState> {
  StreamSubscription? _subscriptions;
  final List<ProductModel> products = [];

  BestProductCubit() : super(BestProductLoading());

  void loadProducts(List<String> productsId) async {
    _subscriptions?.cancel();
    products.clear();

    emit(BestProductLoading());

    for (String id in productsId) {
      final product = await ProductService().getProductById(id);
      if (product != null) {
        products.add(product);
      }
    }
    emit(BestProductSuccess(List.of(products)));
  }

  @override
  Future<void> close() {
    _subscriptions?.cancel();
    return super.close();
  }
}
