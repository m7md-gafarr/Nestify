import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/features/bag/models/bag_item.dart';
import 'package:meta/meta.dart';

part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial()) {
    _initializeBag();
  }

  List<BagItem> _items = [];
  String _promo = '';

  void _initializeBag() {
    _items = [
      BagItem(
        id: '1',
        title: 'Wooden bedside table featuring a raised design',
        imagePath: 'assets/images/pic.png',
        price: 100,
        quantity: 1,
      ),
      BagItem(
        id: '2',
        title: 'Square bedside table with legs, a rattan shelf and a...',
        imagePath: 'assets/images/pic.png',
        price: 100,
        quantity: 2,
      ),
    ];
    _emitLoadedState();
  }

  void _emitLoadedState() {
    final subtotal = _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
    final discount = _promo.trim().isEmpty ? 0.0 : 25.00;
    final total = (subtotal - discount).clamp(0, double.infinity).toDouble();

    emit(BagLoaded(
      items: List.unmodifiable(_items),
      promo: _promo,
      subtotal: subtotal,
      discount: discount,
      total: total,
    ));
  }


  void addPromo(String value) {
    _promo = value;
    _emitLoadedState();
  }

  void clearPromo() {
    _promo = '';
    _emitLoadedState();
  }

  void removeItem(BagItem item) {
    _items.remove(item);
    _emitLoadedState();
  }

  void incrementQuantity(BagItem item) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index].quantity++;
      _emitLoadedState();
    }
  }

  void decrementQuantity(BagItem item) {
    final index = _items.indexOf(item);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index].quantity--;
      _emitLoadedState();
    }
  }

  bool get isEmpty => _items.isEmpty;
}

