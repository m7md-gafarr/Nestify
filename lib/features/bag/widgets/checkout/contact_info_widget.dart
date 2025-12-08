import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
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
              CustomSectionHeaderWidget(
                title: S.of(context).checkoutContactInfo,
              ),

              SizedBox(height: 20.h),

              TextFormField(
                controller: fullNameController,
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: S.of(context).checkoutFullName,
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    ValidationUtils.fullNameValidator(value, context),
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
                  hintText: S.of(context).checkoutPhoneNumber,
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
                decoration: InputDecoration(
                  hintText: S.of(context).checkoutEmail,
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    ValidationUtils.emailValidator(value, context),
              ),
              SizedBox(height: 40.h),
              ElevatedButton(
                onPressed: onNext,
                child: Text(S.of(context).checkoutNext),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
