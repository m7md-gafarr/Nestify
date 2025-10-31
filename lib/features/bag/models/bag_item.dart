class BagItem {
  final String id;
  final String title;
  final String imagePath;
  final double price;
  int quantity;

  BagItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}


