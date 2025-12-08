import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/features/account/logic/address_book/address_book_cubit.dart';
import 'package:depi_graduation_project/features/account/models/address_book/address_book_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewAddressBookScreen extends StatefulWidget {
  const AddNewAddressBookScreen({super.key});

  @override
  State<AddNewAddressBookScreen> createState() =>
      _AddNewAddressBookScreenState();
}

class _AddNewAddressBookScreenState extends State<AddNewAddressBookScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_formKey.currentState?.validate() ?? false) {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final address = AddressBookModel(
        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        country: _countryController.text.trim(),
        createdAt: DateTime.now(),
      );

      context.read<AddressBookCubit>().addAddress(userId, address);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Add New Address"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _streetController,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                decoration: const InputDecoration(
                  hintText: "Street",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Street cannot be empty" : null,
              ),
              SizedBox(height: 18.h),

              TextFormField(
                controller: _cityController,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                decoration: const InputDecoration(
                  hintText: "City",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "City cannot be empty" : null,
              ),
              SizedBox(height: 18.h),

              TextFormField(
                controller: _countryController,

                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: "Country",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Country cannot be empty" : null,
              ),
              SizedBox(height: 30.h),

              BlocBuilder<AddressBookCubit, AddressBookState>(
                builder: (context, state) {
                  if (state is AddressBookLoading) {
                    return CircularProgressIndicator(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    );
                  }

                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveAddress,
                      child: const Text("Save Address"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
