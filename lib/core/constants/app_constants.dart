import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isRTL(BuildContext context) {
  return Intl.getCurrentLocale() == "ar";
}

bool isArabicText(String text) {
  final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
  return arabicRegExp.hasMatch(text);
}

const font = "cairo";
