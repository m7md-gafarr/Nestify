import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/utils/validation_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

  _obscureText_fun() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120.h),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: CustomSectionHeaderWidget(title: 'Nestify'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                RichText(
                  text: TextSpan(
                    text: 'Create Your Account',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(fontSize: 20.sp),
                    children: [
                      TextSpan(
                        text:
                            ' ,If you already have an account register You can ',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
                      ),
                      TextSpan(
                        text: 'Login here !',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 16.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  validator: ValidationUtils.emailValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  obscureText: obscureText,
                  validator: ValidationUtils.passwordValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText ? Iconsax.eye : Iconsax.eye_slash),
                      onPressed: _obscureText_fun,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  obscureText: obscureText,
                  validator: ValidationUtils.passwordValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText ? Iconsax.eye : Iconsax.eye_slash),
                      onPressed: _obscureText_fun,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),

                ElevatedButton(onPressed: () {}, child: Text("Register")),
                SizedBox(height: 40.h),

                Align(
                  alignment: AlignmentGeometry.center,
                  child: Text(
                    "or continue with",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.facebook,
                        size: 40.sp,
                        color: Colors.blue,
                      ),
                    ),

                    SizedBox(width: 20.w),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.g_mobiledata,
                        size: 60.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
