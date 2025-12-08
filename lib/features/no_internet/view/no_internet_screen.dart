import 'package:depi_graduation_project/core/images/app_images.dart';

import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Text("Nestify", style: Theme.of(context).textTheme.headlineLarge),
              Spacer(),
              SvgPicture.asset(
                Assets.assetsImagesSad,
                width: 150.w,
                height: 150.h,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                'no connection',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'so, it’s looks like you don’t have an intternet connection right now',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Spacer(),

              ElevatedButton(
                onPressed: () {
                  context
                      .read<CheckConnectionCubit>()
                      .checkInitialConnectivity();
                },
                child: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
                  builder: (context, state) {
                    if (state is CheckConnectionLoading) {
                      return CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.w,
                      );
                    } else {
                      return Text('try again');
                    }
                  },
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
