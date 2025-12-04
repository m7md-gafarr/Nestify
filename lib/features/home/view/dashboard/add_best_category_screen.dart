import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/data/services/home_service/best_category_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/home/models/categories/best_categories_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBestCategoryScreen extends StatefulWidget {
  const AddBestCategoryScreen({super.key});

  @override
  State<AddBestCategoryScreen> createState() => _AddBestCategoryScreenState();
}

class _AddBestCategoryScreenState extends State<AddBestCategoryScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController orderController = TextEditingController();

  List<ProductModel> products = [];
  Set<String> selectedProducts = {};

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollection.products)
        .get();

    products = snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data(), doc.id))
        .toList();

    setState(() {});
  }

  Future<void> pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _pickedImage = File(file.path);
      });
    }
  }

  Future<void> saveCategory() async {
    if (titleController.text.isEmpty ||
        orderController.text.isEmpty ||
        selectedProducts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields & select products"),
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final imageUrl = await SupabaseStorageService().uploadImage(
        file: _pickedImage!,
        name: titleController.text.trim(),
        folder: FirebaseCollection.bestCategories,
      );

      final id = FirebaseFirestore.instance
          .collection(FirebaseCollection.bestCategories)
          .doc()
          .id;

      final model = BestCategoryModel(
        id: id,
        title: titleController.text.trim(),
        imageUrl: imageUrl ?? "",
        order: int.tryParse(orderController.text) ?? 0,
        products: selectedProducts.toList(),
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await BestCategoryService().addBestCategoryWithId(model);

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
      appBar: AppBar(title: const Text("Add Best Category")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: _pickedImage == null
                    ? Container(
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                        color: Colors.grey[300],
                        child: const Icon(Icons.add_a_photo, size: 40),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _pickedImage!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: orderController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Order",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              products.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final p = products[index];

                        return CheckboxListTile(
                          value: selectedProducts.contains(p.id),
                          title: Text(p.name),
                          subtitle: Text("Price: ${p.price}"),
                          onChanged: (val) {
                            setState(() {
                              if (val == true) {
                                selectedProducts.add(p.id);
                              } else {
                                selectedProducts.remove(p.id);
                              }
                            });
                          },
                        );
                      },
                    ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : saveCategory,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
