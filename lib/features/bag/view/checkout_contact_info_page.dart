import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/validation_utils.dart';

class CheckoutContactInfoPage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final VoidCallback onNext;

  const CheckoutContactInfoPage({
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Contact info',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 20.h),

                      /// Full Name
                      TextFormField(
                        controller: fullNameController,
                        decoration: const InputDecoration(
                          labelText: 'Full name',
                          border: OutlineInputBorder(),
                        ),
                        validator: ValidationUtils.fullNameValidator,
                      ),
                      SizedBox(height: 30.h),

                      /// Phone
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
                      SizedBox(height: 16.h),

                      /// Email
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: ValidationUtils.emailValidator,
                      ),

                      const Spacer(),

                      ElevatedButton(
                        onPressed: onNext,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50.h),
                        ),
                        child: const Text('Continue'),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

