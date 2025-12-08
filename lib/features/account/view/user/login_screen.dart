import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/utils/dialog/dialog_helper.dart';
import 'package:depi_graduation_project/core/utils/validation_utils.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/login/login_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _obscureText_fun() {
    setState(() {
      obscureText = !obscureText;
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
                    child: CustomSectionHeaderWidget(title: 'Nestify'),
                  ),
                  SizedBox(height: 40.h),

                  RichText(
                    text: TextSpan(
                      text: 'Welcome Back',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text:
                              ' ,If you don’t have an account register You can ',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                AppRouteNames.registerScreenRoute,
                              );
                            },
                        ),
                        TextSpan(
                          text: 'Register here !',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                AppRouteNames.registerScreenRoute,
                              );
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                        onPressed: _obscureText_fun,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.forgotPasswordScreenRoute,
                        );
                      },
                      child: Text(
                        'Forgot password ?',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      }
                    },
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          DialogHelper(
                            context,
                          ).showErrorDialog(message: state.errorMessage);
                        } else if (state is LoginNoInternet) {
                          DialogHelper(context).showNoInternetDialog(
                            message: "No Internet Connection",
                          );
                        } else if (state is LoginSuccess) {
                          context.read<GetUserDataCubit>().getUserData();
                          context.read<BagCubit>().loadBagItems(
                            FirebaseAuth.instance.currentUser!.uid,
                          );
                          context.read<SavedItemsCubit>().loadSavedItems(
                            FirebaseAuth.instance.currentUser!.uid,
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouteNames.homePageRoute,
                            (route) => false,
                          );
                        } else if (state is NotCompleteAddData) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouteNames.completeAddDataScreenRoute,
                            (route) => false,
                            arguments: state.credential,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return CircularProgressIndicator(color: Colors.white);
                        } else {
                          return Text('Login');
                        }
                      },
                    ),
                  ),
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
      ),
    );
  }
}
