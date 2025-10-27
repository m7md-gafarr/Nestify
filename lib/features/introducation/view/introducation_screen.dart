import 'package:flutter/material.dart';

class IntroducationScreen extends StatefulWidget {
  const IntroducationScreen({super.key});

  @override
  State<IntroducationScreen> createState() => _IntroducationScreenState();
}

class _IntroducationScreenState extends State<IntroducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Introduction Screen')));
  }
}
