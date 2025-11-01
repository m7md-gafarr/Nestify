import 'package:flutter/foundation.dart';
import 'bag_item.dart';

class BagViewModel extends ChangeNotifier {
  final List<BagItem> _items = [
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

  String _promo = '';

  List<BagItem> get items => List.unmodifiable(_items);
  String get promo => _promo;

  double get subtotal => _items.fold(0, (p, e) => p + e.price * e.quantity);
  double get discount => _promo.trim().isEmpty ? 0 : 25.00;
  double get total => (subtotal - discount).clamp(0, double.infinity);

  void addPromo(String value) {
    _promo = value;
    notifyListeners();
  }

  void clearPromo() {
    _promo = '';
    notifyListeners();
  }

  void removeItem(BagItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void incrementQuantity(BagItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(BagItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  bool get isEmpty => _items.isEmpty;
}
