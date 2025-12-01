import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/home/models/product/product_color_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/features/home/models/rooms/room_model.dart';
import 'package:depi_graduation_project/features/home/models/categories/room_category_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  List<File> pickedImages = [];

  bool isLoading = false;

  List<RoomModel> rooms = [];
  List<RoomCategoryModel> categories = [];

  String? selectedRoomId;
  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    loadRooms();
  }

  List<ProductColor> parseColors(String input) {
    if (input.trim().isEmpty) return [];

    return input.split(",").map((part) {
      final data = part.trim().split(":");
      if (data.length != 2) {
        return ProductColor(name: "", color: Colors.black);
      }

      final name = data[0].trim();
      final hex = data[1].trim();

      return ProductColor(
        name: name,
        color: Color(int.parse(hex.replaceFirst("#", "0xff"))),
      );
    }).toList();
  }

  Future<void> loadRooms() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollection.rooms)
        .orderBy("order")
        .get();

    rooms = snapshot.docs
        .map((doc) => RoomModel.fromJson(doc.data(), doc.id))
        .toList();

    setState(() {});
  }

  Future<void> loadCategories(String roomId) async {
    selectedCategoryId = null;
    categories.clear();
    setState(() {});

    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollection.roomCategories)
        .where("roomId", isEqualTo: roomId)
        .orderBy("order")
        .get();

    categories = snapshot.docs
        .map((doc) => RoomCategoryModel.fromJson(doc.data(), doc.id))
        .toList();

    setState(() {});
  }

  Future<void> pickImages() async {
    final List<XFile> files = await picker.pickMultiImage();
    if (files.isNotEmpty) {
      setState(() {
        pickedImages = files.map((x) => File(x.path)).toList();
      });
    }
  }

  Future<List<String>> uploadAllImages(List<File> images) async {
    List<String> urls = [];

    for (var img in images) {
      final url = await SupabaseStorageService().uploadImage(
        file: img,
        folder: FirebaseCollection.products,
        name: "product_${DateTime.now().millisecondsSinceEpoch}",
      );

      if (url != null) urls.add(url);
    }

    return urls;
  }

  Future<void> saveProduct() async {
    if (nameController.text.isEmpty ||
        descController.text.isEmpty ||
        priceController.text.isEmpty ||
        selectedRoomId == null ||
        selectedCategoryId == null ||
        pickedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      /// Upload Multiple Images
      final urls = await uploadAllImages(pickedImages);

      /// Generate Firestore ID
      final id = FirebaseFirestore.instance
          .collection(FirebaseCollection.products)
          .doc()
          .id;

      /// Parse Colors
      final parsedColors = parseColors(colorController.text.trim());

      /// Create Product Model
      final model = ProductModel(
        id: id,
        name: nameController.text.trim(),
        description: descController.text.trim(),
        price: double.tryParse(priceController.text.trim()) ?? 0,
        imageUrl: urls,
        categoryId: selectedCategoryId!,
        roomId: selectedRoomId!,
        colors: parsedColors,
        productType: typeController.text.trim(),
        quality: qualityController.text.trim(),
        size: sizeController.text.trim(),
        stock: int.tryParse(stockController.text.trim()) ?? 0,
        isActive: true,
        isFeatured: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        details: null,
        reviews: [],
      );

      await ProductService().addProductsByCategoryWithId(model);

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImages,
              child: pickedImages.isEmpty
                  ? Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Icon(Icons.add_a_photo, size: 40),
                    )
                  : Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: pickedImages.map((img) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            img,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
            ),

            const SizedBox(height: 20),

            buildInput(nameController, "Product Name"),
            buildInput(descController, "Description", maxLines: 3),
            buildInput(
              priceController,
              "Price",
              keyboard: TextInputType.number,
            ),
            buildInput(
              stockController,
              "Stock",
              keyboard: TextInputType.number,
            ),
            buildInput(
              colorController,
              "Colors (ex: Red:#ff0000, Blue:#0000ff)",
            ),
            buildInput(typeController, "Product Type"),
            buildInput(qualityController, "Quality"),
            buildInput(sizeController, "Size"),

            const SizedBox(height: 20),

            rooms.isEmpty
                ? const CircularProgressIndicator()
                : DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Select Room",
                      border: OutlineInputBorder(),
                    ),
                    initialValue: selectedRoomId,
                    items: rooms
                        .map(
                          (r) => DropdownMenuItem(
                            value: r.id,
                            child: Text(r.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      selectedRoomId = value;
                      loadCategories(value!);
                    },
                  ),

            const SizedBox(height: 20),

            if (selectedRoomId != null)
              categories.isEmpty
                  ? const Text("No categories yet")
                  : DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Select Category",
                        border: OutlineInputBorder(),
                      ),
                      initialValue: selectedCategoryId,
                      items: categories
                          .map(
                            (c) => DropdownMenuItem(
                              value: c.id,
                              child: Text(c.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => selectedCategoryId = value,
                    ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: isLoading ? null : saveProduct,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Save Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
