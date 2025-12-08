import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/utils/dialog/dialog_helper.dart';
import 'package:depi_graduation_project/core/utils/snakbar/snackebar_helper.dart';
import 'package:depi_graduation_project/core/utils/validation_utils.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/account/logic/complete_add_data/complete_add_data_cubit.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CompleteAddDataScreen extends StatefulWidget {
  const CompleteAddDataScreen({super.key});

  @override
  State<CompleteAddDataScreen> createState() => _CompleteAddDataScreenState();
}

class _CompleteAddDataScreenState extends State<CompleteAddDataScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  int _age = 0;

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final credential =
        ModalRoute.of(context)!.settings.arguments as UserCredential;
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Text(
                  S.of(context).completeProfileTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),

                GestureDetector(
                  onTap: () {
                    _showImagePickerSheet(context);
                  },

                  child: Container(
                    height: 70.w,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: _selectedImage == null
                        ? Icon(
                            Iconsax.user,
                            size: 30.sp,
                            color: Colors.grey[700],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.file(
                              File(_selectedImage!.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10.h),
                _selectedImage == null
                    ? Text(
                        S.of(context).completeProfileUploadPhoto,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 40.h),
                TextFormField(
                  controller: fullNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ValidationUtils.fullNameValidator(value, context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: S.of(context).completeProfileFullName,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  readOnly: true,

                  decoration: InputDecoration(
                    hintText: credential.user!.email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      ValidationUtils.phoneNumberValidator(value, context),
                  maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: S.of(context).completeProfilePhoneNumber,
                    prefixText: '+20 ',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) =>
                      ValidationUtils.addressValidator(value, context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: S.of(context).completeProfileAddress,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: dobController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).completeProfileSelectBirthdate;
                    } else if (_age < 18) {
                      return S.of(context).completeProfileAgeError;
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      cancelText: S.of(context).completeProfileCancel,
                      confirmText: S.of(context).completeProfileConfirm,
                      helpText: S
                          .of(context)
                          .completeProfileSelectBirthdateHelp,

                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        dobController.text =
                            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

                        _age = DateTime.now().year - pickedDate.year;

                        if (DateTime.now().month < pickedDate.month ||
                            (DateTime.now().month == pickedDate.month &&
                                DateTime.now().day < pickedDate.day)) {
                          _age--;
                        }
                      });
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    hintText: S.of(context).completeProfileDateOfBirth,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                ElevatedButton(
                  onPressed: () async {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {
                      String? imageUrl;
                      if (_selectedImage != null) {
                        imageUrl = await SupabaseStorageService().uploadImage(
                          file: File(_selectedImage!.path),
                          folder: FirebaseCollection.users,
                          name: credential.user!.uid,
                        );
                      }

                      context.read<CompleteAddDataCubit>().completeAddData(
                        UserModel(
                          userId: credential.user!.uid,
                          fullName: fullNameController.text.trim(),
                          email: credential.user!.email!,
                          phoneNumber: phoneController.text.trim(),
                          address: addressController.text.trim(),
                          dateOfBirth: dobController.text.trim(),
                          profileImageUrl: imageUrl ?? '',
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 15.0,
                    ),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child:
                      BlocConsumer<CompleteAddDataCubit, CompleteAddDataState>(
                        listener: (context, state) {
                          if (state is CompleteAddDataSuccess) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouteNames.homePageRoute,
                              (route) => false,
                            );
                          } else if (state is CompleteAddDataFailure) {
                            SnackbarHelper.showError(
                              context,
                              state.errorMessage,
                            );
                          } else if (state is CompleteAddDataNoInternet) {
                            DialogHelper(context).showNoInternetDialog(
                              message: S.of(context).completeProfileNoInternet,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is CompleteAddDataLoading) {
                            return SizedBox(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            );
                          }
                          return Text(S.of(context).completeProfileComplete);
                        },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePickerSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Iconsax.camera),
                title: Text(
                  S.of(context).completeProfileCamera,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  Navigator.pop(context, pickedFile);
                },
              ),
              ListTile(
                leading: Icon(Iconsax.gallery),
                title: Text(
                  S.of(context).completeProfileGallery,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  Navigator.pop(context, pickedFile);
                },
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value != null && value is XFile) {
        _selectedImage = value;
        setState(() {});
      }
    });
  }
}
