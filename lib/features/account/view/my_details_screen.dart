import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/core/utils/validation_utils.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/update_user_data/update_data_cubit.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  UserModel? user;

  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController dobController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _age = 0;
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    arguments() {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null && args is UserModel) {
        user = args;
        nameController.text = user!.fullName;
        emailController.text = user!.email;
        phoneController.text = user!.phoneNumber;
        dobController.text = user!.dateOfBirth;
      }
    }

    arguments();
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "My Details",
        actions: [
          TextButton(
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                context.read<UpdateDataCubit>().updateUserData(
                  UserModel(
                    userId: user!.userId,
                    fullName: nameController.text.trim(),
                    email: user!.email,
                    phoneNumber: phoneController.text.trim(),
                    address: user!.address,
                    dateOfBirth: dobController.text.trim(),
                  ),
                );
              }
            },
            child: BlocConsumer<UpdateDataCubit, UpdateDataState>(
              listener: (context, state) {
                if (state is UpdateDataSuccess) {
                  context.read<GetUserDataCubit>().getUserData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Profile updated successfully",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                } else if (state is UpdateDataFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is UpdateDataLoading) {
                  return SizedBox(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      strokeWidth: 2.w,
                    ),
                  );
                } else {
                  return Text(
                    "Save",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                _buildProfileImage(),
                SizedBox(height: 10.h),
                Text(
                  "Change Profile Picture",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  controller: nameController,
                  validator: ValidationUtils.fullNameValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Full Name',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  readOnly: true,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: ValidationUtils.phoneNumberValidator,
                  maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefixText: '+20 ',

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
                      return "select birthdate";
                    } else if (_age < 18) {
                      return "Age must be at least 18 years old";
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      cancelText: 'Close',
                      confirmText: 'OK',
                      helpText: 'Select your birthdate',

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
                    hintText: 'Date of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    if (_selectedImage != null) {
      return GestureDetector(
        onTap: () {
          _showImagePickerSheet(context);
        },
        child: CircleAvatar(
          radius: 50.r,
          backgroundImage: FileImage(File(_selectedImage!.path)),
        ),
      );
    }

    if (user != null &&
        user!.profileImageUrl != null &&
        user!.profileImageUrl!.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          _showImagePickerSheet(context);
        },
        child: CircleAvatar(
          radius: 50.r,
          backgroundImage: NetworkImage(user!.profileImageUrl!),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        _showImagePickerSheet(context);
      },
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: Colors.grey[300],
        child: Icon(Iconsax.user, size: 40.sp, color: Colors.white),
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
                  "Camera",
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
                  "Gallery",
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
