import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/validation_utils.dart';

class CheckoutContactInfoWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final VoidCallback onNext;

  const CheckoutContactInfoWidget({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40.h),
              const CustomSectionHeaderWidget(title: 'Contact info'),

              SizedBox(height: 20.h),

              TextFormField(
                controller: fullNameController,
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Full name',
                  border: OutlineInputBorder(),
                ),
                validator: ValidationUtils.fullNameValidator,
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
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: ValidationUtils.emailValidator,
              ),
              SizedBox(height: 40.h),
              ElevatedButton(onPressed: onNext, child: Text("Next")),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
