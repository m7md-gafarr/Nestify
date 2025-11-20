import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: CustomSectionHeaderWidget(title: 'my account'),
              ),

              Spacer(),
              SvgPicture.asset(
                Assets.assetsImagesSmiley,
                width: 120.w,
                height: 120.w,
              ),
              Text(
                'come on in',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'view orders and update your details by logging into your account',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteNames.loginScreenRoute);
                },
                child: Text("Continue with Email"),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
