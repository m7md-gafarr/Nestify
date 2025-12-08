import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/components/shimmer_network_image_widget.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';
import 'package:depi_graduation_project/data/services/account_service/auth_service.dart';
import 'package:depi_graduation_project/generated/l10n.dart';

import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/account/view/dashboard/admin_screen.dart';
import 'package:depi_graduation_project/features/account/widgets/empty_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserNotLoggedIn) {
            return const EmptyAccountWidget();
          } else if (state is GetUserDataLoading ||
              state is GetUserDataInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUserDataSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminScreen()),
                      );
                    },
                    child: CustomSectionHeaderWidget(
                      title: S.of(context).accountMyAccount,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ShimmerNetworkImage(
                      imageUrl: state.userModel.profileImageUrl!,
                      width: 50.w,
                      height: 50.w,
                      borderRadius: BorderRadius.circular(50.r),
                      fit: BoxFit.cover,
                    ),

                    title: Text(
                      state.userModel.fullName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      state.userModel.phoneNumber,
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.bag_2, size: 24.sp),
                    title: Text(
                      S.of(context).accountMyOrders,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        AppRouteNames.myOrdersScreenRoute,
                      );
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.user, size: 24.sp),
                    title: Text(
                      S.of(context).accountMyDetails,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        AppRouteNames.myDetailsScreenRoute,
                        arguments: context.read<GetUserDataCubit>().userData,
                      );
                    },
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.location, size: 24.sp),
                    title: Text(
                      S.of(context).accountAddressBook,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        AppRouteNames.addressBookScreenRoute,
                      );
                    },
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.setting, size: 24.sp),
                    title: Text(
                      S.of(context).accountSetting,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        AppRouteNames.settingsScreenRoute,
                      );
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Iconsax.logout,
                      size: 24.sp,
                      color: Colors.red,
                    ),
                    title: Text(
                      S.of(context).accountLogout,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text(
                            S.of(context).accountLogoutTitle,
                            textAlign: TextAlign.center,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.of(context).accountLogoutMessage,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                              ElevatedButton(
                                child: Text(S.of(context).accountLogoutStay),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(height: 10.h),
                              OutlinedButton(
                                child: Text(S.of(context).accountLogoutConfirm),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  AuthService().logout();
                                  SharedPreferencesService()
                                      .logoutUserLoginStatus();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRouteNames.loginScreenRoute,
                                    (route) => false,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
