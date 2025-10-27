import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IntroducationScreen extends StatefulWidget {
  const IntroducationScreen({super.key});

  @override
  State<IntroducationScreen> createState() => _IntroducationScreenState();
}

class _IntroducationScreenState extends State<IntroducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70.h,
            child: SvgPicture.asset(
              Assets.assetsImagesElement,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Define\nyour\nspace in\nyour\nunique way.",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w100,
                letterSpacing: 1.3,
              ),
            ),
          ),
          SvgPicture.asset(
            Assets.assetsImagesOnboarding,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.0.w,
                    right: 25.0.w,
                    top: 50.h,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      SharedPreferencesService().saveOnboardingStatus(true);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRouteNames.homePageRoute,
                        (route) => false,
                      );
                    },
                    child: Text("Get Started"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
