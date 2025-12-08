import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;

  _toggleSwitch() {
    setState(() {
      _notificationsEnabled = !_notificationsEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Settings"),
      body: Column(
        children: [
          ListTile(
            title: const Text("Notifications"),
            trailing: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: _notificationsEnabled,
                onChanged: (val) {
                  _toggleSwitch();
                },
              ),
            ),
          ),
          ListTile(
            title: const Text("Theme"),
            trailing: Text("Light", style: TextStyle(fontSize: 16.sp)),
          ),
          ListTile(
            title: const Text("Language"),
            trailing: Text("English", style: TextStyle(fontSize: 16.sp)),
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 16.sp,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRouteNames.privacyPolicyScreenRoute,
                );
              },
            ),
          ),
          ListTile(
            title: const Text("Terms and Conditions"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 16.sp,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRouteNames.termsAndConditionsScreenRoute,
                );
              },
            ),
          ),
          ListTile(
            title: const Text("About"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 16.sp,
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.aboutScreenRoute);
              },
            ),
          ),
          Spacer(),

          Text("version 1.0.0"),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
