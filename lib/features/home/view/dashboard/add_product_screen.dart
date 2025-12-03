import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/data/services/home_service/product_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/models/product/product_color_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_details_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/features/home/models/rooms/room_model.dart';
import 'package:depi_graduation_project/features/home/models/categories/room_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController colorNameController = TextEditingController();
  final TextEditingController colorCodeController = TextEditingController();

  /// Measurements
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController depthController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  /// Composition
  final TextEditingController mainMaterialController = TextEditingController();
  final TextEditingController secondaryMaterialController =
      TextEditingController();
  List<ProductColor> colors = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();
  List<File> pickedImages = [];

  bool isLoading = false;

  List<RoomModel> rooms = [];
  List<RoomCategoryModel> categories = [];

  String? selectedRoomId;
  String? selectedCategoryId;
  String? selectedQuality;
  String? selectedProductType;
  String? selectedSize;

  final List<String> qualityOptions = ["Premium", "High", "Standard"];
  final List<String> productTypes = [
    // Seating
    "Chair",
    "Arm Chair",
    "Dining Chair",
    "Office Chair",
    "Recliner",
    "Stool",
    "Bench",
    "Sofa",
    "Loveseat",
    "Sectional Sofa",

    // Tables
    "Table",
    "Coffee Table",
    "Dining Table",
    "Side Table",
    "Bedside Table",
    "Console Table",
    "Study Desk",
    "Office Desk",

    // Storage
    "Cabinet",
    "Wardrobe",
    "Dresser",
    "Chest of Drawers",
    "Bookcase",
    "Shelf",
    "TV Unit",
    "Shoe Rack",

    // Bedroom
    "Bed",
    "Nightstand",
    "Headboard",
    "Mattress",

    // Kitchen
    "Kitchen Cabinet",
    "Kitchen Island",

    // Outdoor
    "Outdoor Chair",
    "Outdoor Table",
    "Garden Bench",
    "Patio Sofa",

    // Décor
    "Mirror",
    "Wall Art",
    "Lamp",
    "Pendant Light",
    "Rug",

    // Kids
    "Kids Bed",
    "Kids Table",
    "Kids Cabinet",
  ];
  final List<String> sizeOptions = ["Small", "Medium", "Large", "Extra Large"];
  @override
  void initState() {
    super.initState();
    loadRooms();
  }

  Future<void> addColor(String ColorName, String colorCode) async {
    setState(() {
      colors.add(
        ProductColor(
          name: ColorName,
          color: Color(int.parse(colorCode.replaceFirst('#', '0xff'))),
        ),
      );
    });
    colorNameController.clear();
    colorCodeController.clear();
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

  Future<List<String>> uploadAllImages(
    String productId,
    List<File> images,
  ) async {
    final futures = images.map((img) {
      return SupabaseStorageService().uploadImage(
        file: img,
        folder: FirebaseCollection.products,
        name: "image_$productId",
      );
    }).toList();

    final urls = await Future.wait(futures);
    return urls.whereType<String>().toList();
  }

  Future<void> saveProduct() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
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
        final id = await ProductService().addProductId();
        final urls = await uploadAllImages(id, pickedImages);

        /// Build Measurements
        final measurements = Measurements(
          height: heightController.text.trim(),
          width: widthController.text.trim(),
          depth: depthController.text.trim(),
          weight: weightController.text.trim(),
        );

        /// Build Composition
        final composition = Composition(
          mainMaterial: mainMaterialController.text.trim(),
          secondaryMaterial: secondaryMaterialController.text.trim(),
        );

        /// Build ProductDetails
        final details = ProductDetails(
          measurements: measurements,
          composition: composition,
        );

        final model = ProductModel(
          id: id,
          name: nameController.text.trim(),
          description: descController.text.trim(),
          price: double.tryParse(priceController.text.trim()) ?? 0,
          imageUrl: urls,
          categoryId: selectedCategoryId!,
          roomId: selectedRoomId!,
          colors: colors,
          productType: selectedProductType!,
          quality: selectedQuality!,
          size: selectedSize!,
          stock: int.tryParse(stockController.text.trim()) ?? 0,
          isActive: true,
          isFeatured: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          details: details,
          reviews: [],
        );

        await context.read<ProductCubit>().uploadProducts(model);

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }

      setState(() => isLoading = false);
    }
  }

  @override
  dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    stockController.dispose();
    colorNameController.dispose();
    colorCodeController.dispose();
    heightController.dispose();
    widthController.dispose();
    depthController.dispose();
    weightController.dispose();
    mainMaterialController.dispose();
    secondaryMaterialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Add New Product"),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImages,
                child: pickedImages.isEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 120.w,
                          width: 120.w,
                          color: Colors.grey[300],
                          alignment: Alignment.center,
                          child: const Icon(Icons.add_a_photo, size: 40),
                        ),
                      )
                    : Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: pickedImages.map((img) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              img,
                              height: 120.w,
                              width: 120.w,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
              ),

              const SizedBox(height: 20),

              _buildInput(nameController, "Product Name"),
              _buildInput(descController, "Description", maxLines: 3),
              Row(
                children: [
                  Expanded(
                    child: _buildInput(
                      priceController,
                      "Price",
                      keyboard: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildInput(
                      stockController,
                      "Stock",
                      keyboard: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildInput(
                      colorNameController,
                      "Color Name",
                      keyboard: TextInputType.text,
                      validator: (value) {
                        if (colors.isNotEmpty) {
                          if (value != null && value.trim().isEmpty) {
                            return null;
                          }
                        }
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter color name";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildInput(
                      colorCodeController,
                      "Code (ex:#ff0000)",
                      validator: (value) {
                        if (colors.isNotEmpty) {
                          if (value != null && value.trim().isEmpty) {
                            return null;
                          }
                        }

                        if (value == null || value.trim().isEmpty) {
                          return "Please enter hex color";
                        }

                        final hex = value.trim();

                        // must start with #
                        if (!hex.startsWith("#")) {
                          return "Hex must start with #";
                        }

                        // length must be 7 = (# + 6 digits)
                        if (hex.length != 7) {
                          return "Hex must be 7 characters (# + 6 digits)";
                        }

                        final hexOnly = hex.substring(1);

                        // check valid hex numbers
                        final regex = RegExp(r'^[0-9A-Fa-f]{6}$');
                        if (!regex.hasMatch(hexOnly)) {
                          return "Invalid hex color";
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              colors.isEmpty
                  ? SizedBox.shrink()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: List.generate(colors.length, (index) {
                          final name = colors[index].name;
                          final Color dotColor = colors[index].color;

                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 18.sp,
                                height: 18.sp,
                                decoration: BoxDecoration(
                                  color: dotColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(name),
                            ],
                          );
                        }),
                      ),
                    ),
              colors.isEmpty ? SizedBox.shrink() : SizedBox(height: 15),
              OutlinedButton(
                onPressed:
                    (colorNameController.text.isEmpty ||
                        colorCodeController.text.isEmpty)
                    ? null
                    : () {
                        addColor(
                          colorNameController.text,
                          colorCodeController.text,
                        );
                      },
                child: const Text("Add Color"),
              ),
              SizedBox(height: 15),
              _buildDropdown(
                label: "Product Type",
                value: selectedProductType,
                items: productTypes,
                onChanged: (v) {
                  setState(() {
                    selectedProductType = v;
                  });
                },
              ),

              _buildDropdown(
                label: "Quality",
                value: selectedQuality,
                items: qualityOptions,
                onChanged: (v) {
                  setState(() {
                    selectedQuality = v;
                  });
                },
              ),

              _buildDropdown(
                label: "Size",
                value: selectedSize,
                items: sizeOptions,
                onChanged: (v) {
                  setState(() {
                    selectedSize = v;
                  });
                },
              ),

              const SizedBox(height: 25),

              /// Measurements
              Row(
                children: [
                  Text(
                    "Measurements",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),

              Row(
                children: [
                  Expanded(
                    child: _buildInput(
                      heightController,
                      "Height",
                      keyboard: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildInput(
                      widthController,
                      "Width",
                      keyboard: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildInput(
                      depthController,
                      "Depth",
                      keyboard: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildInput(
                      weightController,
                      "Weight",
                      keyboard: TextInputType.number,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// Composition
              Row(
                children: [
                  Text(
                    "Composition",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),

              _buildInput(mainMaterialController, "Main Material"),
              _buildInput(
                secondaryMaterialController,
                "Secondary Material",
                validator: (_) {
                  return null;
                },
              ),

              const SizedBox(height: 25),

              /// Room Dropdown
              rooms.isEmpty
                  ? const CircularProgressIndicator()
                  : DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        hintText: "Select Room",
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
                        selectedRoomId = value;
                        loadCategories(value!);
                      },
                    ),

              const SizedBox(height: 20),

              /// Category Dropdown
              if (selectedRoomId != null)
                categories.isEmpty
                    ? const Text("No categories yet")
                    : DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          hintText: "Select Category",
                          border: OutlineInputBorder(),
                        ),
                        items: categories
                            .map(
                              (c) => DropdownMenuItem(
                                value: c.id,
                                child: Text(c.name),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          selectedCategoryId = value;
                        },
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
      ),
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboard,
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "Please enter $label";
              }
              return null;
            },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        validator:
            validator ??
            (v) {
              if (v == null || v.isEmpty) return "This field is required";
              return null;
            },
      ),
    );
  }
}
