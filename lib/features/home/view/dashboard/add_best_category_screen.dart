import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/data/services/home_service/best_category_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/home/models/categories/best_categories_model.dart';

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

  File? _pickedImage;

  final ImagePicker _picker = ImagePicker();

  bool isLoading = false;

  Future<void> pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _pickedImage = File(file.path);
      });
    }
  }

  Future<void> saveCategory() async {
    if (titleController.text.isEmpty || orderController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() => isLoading = true);

    try {
      final imageUrl = await SupabaseStorageService().uploadImage(
        file: _pickedImage!,
        name: titleController.text.trim(),
        folder: FirebaseCollection.bestCategories,
      );

      final model = BestCategoryModel(
        id: FirebaseFirestore.instance
            .collection(FirebaseCollection.bestCategories)
            .doc()
            .id,
        title: titleController.text.trim(),
        imageUrl: imageUrl ?? "",
        order: int.tryParse(orderController.text) ?? 0,
        products: [],
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
