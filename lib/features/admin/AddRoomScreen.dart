import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/data/services/firestore_home_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/home/model/room_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController orderController = TextEditingController();

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  Future<void> pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => _pickedImage = File(file.path));
    }
  }

  Future<void> saveRoom() async {
    if (nameController.text.isEmpty || orderController.text.isEmpty) {
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
      final imageUrl = await SupabaseStorageService().uploadImage(
        file: _pickedImage!,
        name: nameController.text.trim(),
        folder: FirebaseCollection.rooms,
      );

      final id = FirebaseFirestore.instance
          .collection(FirebaseCollection.rooms)
          .doc()
          .id;

      final model = RoomModel(
        id: id,
        name: nameController.text.trim(),
        imageUrl: imageUrl ?? "",
        order: int.tryParse(orderController.text) ?? 0,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await FirestoreHomeService().addRoomsWithId(model);

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
      appBar: AppBar(title: const Text('Add Room')),
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
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Room Name",
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
                  onPressed: isLoading ? null : saveRoom,
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
