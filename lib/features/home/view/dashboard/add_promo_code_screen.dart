import 'package:depi_graduation_project/data/services/promo_code/promo_code_service.dart';
import 'package:depi_graduation_project/features/bag/models/promo_code/promo_code_model.dart';
import 'package:flutter/material.dart';

class AddPromoCodeScreen extends StatefulWidget {
  const AddPromoCodeScreen({super.key});

  @override
  State<AddPromoCodeScreen> createState() => _AddPromoCodeScreenState();
}

class _AddPromoCodeScreenState extends State<AddPromoCodeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController orderController = TextEditingController();

  bool isLoading = false;

  Future<void> savePromoCode() async {
    if (nameController.text.isEmpty || orderController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() => isLoading = true);

    try {
      final model = PromoCodeModel(
        code: nameController.text.trim(),
        discountPercentage: double.parse(orderController.text.trim()),
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );

      await PromoCodeService().addPromoCodeByCode(model);

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
              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Promo Code",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: orderController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Discount Percentage",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : savePromoCode,
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
