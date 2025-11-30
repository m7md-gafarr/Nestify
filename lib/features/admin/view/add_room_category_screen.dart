import 'dart:io';
import 'package:depi_graduation_project/data/services/home_service/room_category_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/home/model/rooms/room_model.dart';
import 'package:depi_graduation_project/features/home/model/categories/room_category_model.dart';

class AddRoomCategoryScreen extends StatefulWidget {
  const AddRoomCategoryScreen({super.key});

  @override
  State<AddRoomCategoryScreen> createState() => _AddRoomCategoryScreenState();
}

class _AddRoomCategoryScreenState extends State<AddRoomCategoryScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController orderController = TextEditingController();

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  String? selectedRoomId;

  List<RoomModel> rooms = [];

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  Future<void> getRooms() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollection.rooms)
        .orderBy("order")
        .get();

    rooms = snapshot.docs
        .map((doc) => RoomModel.fromJson(doc.data(), doc.id))
        .toList();

    setState(() {});
  }

  Future<void> pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => _pickedImage = File(file.path));
    }
  }

  Future<void> saveCategory() async {
    if (nameController.text.isEmpty ||
        orderController.text.isEmpty ||
        selectedRoomId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    if (_pickedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select an image")));
      return;
    }

    setState(() => isLoading = true);

    try {
      // Upload Image
      final imageUrl = await SupabaseStorageService().uploadImage(
        file: _pickedImage!,
        name: nameController.text.trim(),
        folder: FirebaseCollection.roomCategories,
      );

      // Generate Firestore ID
      final id = FirebaseFirestore.instance
          .collection(FirebaseCollection.roomCategories)
          .doc()
          .id;

      // Create Model
      final model = RoomCategoryModel(
        id: id,
        name: nameController.text.trim(),
        imageUrl: imageUrl ?? "",
        order: int.tryParse(orderController.text) ?? 0,
        roomId: selectedRoomId!, // الغرفة المختارة
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await RoomCategoryService().addRoomCategoriesWithId(model);

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
      appBar: AppBar(title: const Text('Add Room Category')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // IMAGE
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

              // CATEGORY NAME
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Category Name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // ORDER
              TextField(
                controller: orderController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Order",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // ROOMS DROPDOWN
              rooms.isEmpty
                  ? const CircularProgressIndicator()
                  : DropdownButtonFormField<String>(
                      initialValue: selectedRoomId,
                      decoration: const InputDecoration(
                        labelText: "Select Room",
                        border: OutlineInputBorder(),
                      ),
                      items: rooms
                          .map(
                            (r) => DropdownMenuItem(
                              value: r.id,
                              child: Text(r.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRoomId = value;
                        });
                      },
                    ),

              const SizedBox(height: 30),

              // SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : saveCategory,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Save Category"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
