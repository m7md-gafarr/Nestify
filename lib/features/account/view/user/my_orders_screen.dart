import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(S.of(context).myOrdersMessage)));
  }
}
