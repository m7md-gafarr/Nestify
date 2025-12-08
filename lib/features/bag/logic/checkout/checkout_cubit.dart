import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/bag_service/bag_service.dart';
import 'package:depi_graduation_project/features/bag/models/order/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  final BagService _bagService = BagService();
  Future<void> processCheckout(OrderModel order, String orderId) async {
    emit(CheckoutLoading());
    try {
      await _bagService.saveOrder(order, orderId);
      await _bagService.clearBag(FirebaseAuth.instance.currentUser!.uid);
      emit(CheckoutSuccess(orderId));
    } catch (e) {
      emit(CheckoutFailure(e.toString()));
    }
  }
}
