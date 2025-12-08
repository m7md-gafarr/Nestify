import 'dart:async';

import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/utils/dialog/dialog_helper.dart';
import 'package:depi_graduation_project/core/utils/validation_utils.dart';
import 'package:depi_graduation_project/features/account/logic/forgot_password/forgot_password_cubit.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool canResend = true;
  int remainingSeconds = 0;
  Timer? timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void startTimer() {
    setState(() {
      canResend = false;
      remainingSeconds = 120;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingSeconds--;

        if (remainingSeconds <= 0) {
          canResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: ''),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: CustomSectionHeaderWidget(
                      title: S.of(context).forgotPasswordTitle,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      S.of(context).forgotPasswordInstruction,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
                    ),
                  ),

                  SizedBox(height: 40.h),
                  TextFormField(
                    controller: emailController,
                    validator: ValidationUtils.emailValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: S.of(context).forgotPasswordEmail,
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: canResend
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context
                                  .read<ForgotPasswordCubit>()
                                  .forgotPassword(
                                    email: emailController.text.trim(),
                                  );
                            }
                          }
                        : null,

                    child:
                        BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                          listener: (context, state) {
                            if (state is ForgotPasswordFailure) {
                              DialogHelper(
                                context,
                              ).showErrorDialog(message: state.errorMessage);
                            } else if (state is ForgotPasswordNoInternet) {
                              DialogHelper(context).showNoInternetDialog(
                                message: S.of(context).forgotPasswordNoInternet,
                              );
                            } else if (state is ForgotPasswordSuccess) {
                              startTimer();
                              DialogHelper(context).showSuccessDialog(
                                message: S.of(context).forgotPasswordSuccess,
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      S.of(context).forgotPasswordOk,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is ForgotPasswordLoading) {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            } else {
                              return Text(S.of(context).forgotPasswordSendLink);
                            }
                          },
                        ),
                  ),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      canResend
                          ? S.of(context).forgotPasswordResendNow
                          : "${S.of(context).forgotPasswordResendAfter} ${formatTime(remainingSeconds)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
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
