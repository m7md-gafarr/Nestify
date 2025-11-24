import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/data/services/auth_service.dart';

import 'package:depi_graduation_project/data/services/user_firestore_service.dart';
import 'package:depi_graduation_project/features/account/models/complete_ddd_data_model.dart';
import 'package:depi_graduation_project/features/account/widgets/empty_account_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isLoggedIn = false;
  CompleteAddDataModel? user;
  @override
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // Not logged in
      setState(() => isLoggedIn = false);
      return;
    }

    // User is logged in
    setState(() => isLoggedIn = true);

    // Load user data from Firestore
    user = await UserFirestoreService().getUserData(currentUser.uid);

    // After getting Firestore data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoggedIn == true
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  CustomSectionHeaderWidget(title: 'my account'),
                  SizedBox(height: 20.h),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: (user != null && user!.profileImageUrl!.isNotEmpty)
                        ? CircleAvatar(
                            radius: 30.r,
                            backgroundImage: NetworkImage(
                              user!.profileImageUrl!,
                            ),
                          )
                        : CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Iconsax.user,
                              size: 30.sp,
                              color: Colors.white,
                            ),
                          ),

                    title: Text(
                      user?.fullName ?? 'John Doe',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      user?.phoneNumber ?? '+1 234 567 890',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.bag_2, size: 24.sp),
                    title: Text(
                      'My orders',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.user, size: 24.sp),
                    title: Text(
                      'My Details',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {},
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.location, size: 24.sp),
                    title: Text(
                      'Address book',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.cards, size: 24.sp),
                    title: Text(
                      'Payment Methods',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Iconsax.setting, size: 24.sp),
                    title: Text(
                      'Setting',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () async {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Iconsax.logout,
                      size: 24.sp,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () async {
                      await AuthService().logout();
                      setState(() {
                        isLoggedIn = false;
                      });
                    },
                  ),
                ],
              ),
            )
          : EmptyAccountWidget(),
    );
  }
}
