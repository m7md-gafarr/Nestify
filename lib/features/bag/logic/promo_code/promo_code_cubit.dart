import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/promo_code/promo_code_service.dart';
import 'package:depi_graduation_project/features/bag/models/promo_code/promo_code_model.dart';
import 'package:meta/meta.dart';

part 'promo_code_state.dart';

class PromoCodeCubit extends Cubit<PromoCodeState> {
  PromoCodeCubit() : super(PromoCodeInitial());

  final PromoCodeService _service = PromoCodeService();

  Future<void> applyPromoCode(String code, double total) async {
    emit(PromoCodeLoading());

    try {
      final promo = await _service.getPromoCodeByCode(code);

      if (promo == null) {
        emit(PromoCodeError('Invalid or expired promo code'));
        return;
      }

      final discount = total * (promo.discountPercentage / 100);

      emit(PromoCodeLoaded(promo, discount));
    } catch (e) {
      emit(PromoCodeError('Failed to apply promo code'));
    }
  }
}
