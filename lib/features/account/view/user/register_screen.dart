import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/utils/dialog/dialog_helper.dart';
import 'package:depi_graduation_project/core/utils/validation_utils.dart';
import 'package:depi_graduation_project/features/account/logic/register/register_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassWord = true;
  bool obscureConfirmPassWord = true;
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  _obscurePassWord_fun() {
    setState(() {
      obscurePassWord = !obscurePassWord;
    });
  }

  _obscureConfirmPassWord_fun() {
    setState(() {
      obscureConfirmPassWord = !obscureConfirmPassWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: ""),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
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
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
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
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    obscureText: obscurePassWord,
                    validator: ValidationUtils.strongPasswordValidator,

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassWord ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                        onPressed: _obscurePassWord_fun,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    obscureText: obscureConfirmPassWord,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureConfirmPassWord
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                        onPressed: _obscureConfirmPassWord_fun,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context).register(
                          email: _emailController.text.trim(),
                          password: password,
                        );
                      }
                    },
                    child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterFailure) {
                          DialogHelper(
                            context,
                          ).showErrorDialog(message: state.errorMessage);
                        } else if (state is RegisterNoInternet) {
                          DialogHelper(context).showNoInternetDialog(
                            message: "No Internet Connection",
                          );
                        } else if (state is RegisterSuccess) {
                          DialogHelper(context).showSuccessDialog(
                            message:
                                "Registration Successful check your email to verify your account",
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return CircularProgressIndicator(color: Colors.white);
                        } else {
                          return Text('Register');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPasswordRule(
                        "At least 6 characters",
                        ValidationUtils.hasMinLength(password),
                      ),
                      buildPasswordRule(
                        "Contains an uppercase letter",
                        ValidationUtils.hasUpperCase(password),
                      ),
                      buildPasswordRule(
                        "Contains a number",
                        ValidationUtils.hasNumber(password),
                      ),
                      buildPasswordRule(
                        "Contains a special character",
                        ValidationUtils.hasSpecialChar(password),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordRule(String text, bool valid) {
    return Row(
      children: [
        Icon(
          valid ? Icons.check_circle : Icons.circle_outlined,
          color: valid ? Colors.green : Colors.grey,
          size: 18.sp,
        ),
        SizedBox(width: 6.w),
        Text(text, style: TextStyle(color: valid ? Colors.green : Colors.grey)),
      ],
    );
  }
}
