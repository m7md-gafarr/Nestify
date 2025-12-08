import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/features/bag/models/bag/bag_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/data/services/bag_service/bag_service.dart';

part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial());

  final BagService _service = BagService();
  StreamSubscription? _subscription;

  void loadBagItems(String userId) {
    emit(BagLoading());

    _subscription?.cancel();

    _subscription = _service.listenToBagItems(userId).listen((bag) async {
      List<ProductModel> products = [];

      for (final item in bag.items) {
        final product = await ProductService().getProductById(item.productId);
        if (product != null) products.add(product);
      }

      emit(BagSuccess(products, bag));
    }, onError: (e) => emit(BagError(e.toString())));
  }

  Future<void> addBagItem({
    required String userId,
    required ProductModel product,
  }) async {
    try {
      await _service.addOrIncrementItem(userId: userId, product: product);
    } catch (e) {
      emit(BagError(e.toString()));
    }
  }

  Future<void> incrementQuantity({
    required String userId,
    required String productId,
  }) async {
    try {
      await _service.updateQuantity(
        userId: userId,
        productId: productId,
        change: 1,
      );
    } catch (e) {
      emit(BagError(e.toString()));
    }
  }

  Future<void> decrementQuantity({
    required String userId,
    required String productId,
  }) async {
    try {
      await _service.updateQuantity(
        userId: userId,
        productId: productId,
        change: -1,
      );
    } catch (e) {
      emit(BagError(e.toString()));
    }
  }

  Future<void> removeItem({
    required String userId,
    required String productId,
  }) async {
    try {
      await _service.removeItem(userId: userId, productId: productId);
    } catch (e) {
      emit(BagError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
