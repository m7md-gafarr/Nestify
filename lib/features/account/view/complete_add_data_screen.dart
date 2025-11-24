import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final credential =
        ModalRoute.of(context)!.settings.arguments as UserCredential;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Text(
                'Set up your profile',
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
                      ? Icon(Iconsax.user, size: 30.sp, color: Colors.grey[700])
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
                      'Upload or take a photo',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 40.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                readOnly: true,

                decoration: InputDecoration(
                  hintText: credential.user!.email,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Date of Birth',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 15.0,
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Complete Now'),
              ),
            ],
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
          height: 160,
          child: Column(
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
