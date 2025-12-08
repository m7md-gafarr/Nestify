import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/features/account/logic/address_book/address_book_cubit.dart';
import 'package:depi_graduation_project/features/account/models/address_book/address_book_model.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
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
      appBar: CustomAppBarWidget(title: S.of(context).addAddressTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _streetController,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                decoration: InputDecoration(
                  hintText: S.of(context).addAddressStreet,
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? S.of(context).addAddressStreetError : null,
              ),
              SizedBox(height: 18.h),

              TextFormField(
                controller: _cityController,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                decoration: InputDecoration(
                  hintText: S.of(context).addAddressCity,
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? S.of(context).addAddressCityError : null,
              ),
              SizedBox(height: 18.h),

              TextFormField(
                controller: _countryController,

                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: S.of(context).addAddressCountry,
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty
                    ? S.of(context).addAddressCountryError
                    : null,
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
                      child: Text(S.of(context).addAddressSave),
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
