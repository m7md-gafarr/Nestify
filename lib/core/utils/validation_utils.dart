import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class ValidationUtils {
  static bool hasUpperCase(String value) => RegExp(r'[A-Z]').hasMatch(value);

  static bool hasNumber(String value) => RegExp(r'\d').hasMatch(value);

  static bool hasSpecialChar(String value) => RegExp(
    r'[!@#$&*~%^()\-_=+{}\[\]:;"'
    r"'"
    r'<>,./?\\|]',
  ).hasMatch(value);

  static bool hasMinLength(String value) => value.length >= 6;

  static String? emailValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationEmailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return S.of(context).validationEmailInvalidFormat;
    }

    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationPasswordRequired;
    }

    if (value.length < 6) {
      return S.of(context).validationPasswordMinLength;
    }

    return null;
  }

  static String? strongPasswordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationPasswordRequired;
    }

    final containsUpper = hasUpperCase(value);
    final containsNumber = hasNumber(value);
    final containsSpecial = hasSpecialChar(value);
    final meetsMinLen = hasMinLength(value);

    if (!containsUpper || !containsNumber || !containsSpecial || !meetsMinLen) {
      return S.of(context).validationPasswordConditions;
    }

    return null;
  }

  static String? fullNameValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationFullNameRequired;
    }
    return null;
  }

  static String? phoneNumberValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationPhoneNumberRequired;
    }

    final phoneRegex = RegExp(r'^(10|11|12|15)[0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return S.of(context).validationPhoneNumberInvalid;
    }

    return null;
  }

  static String? addressValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationAddressRequired;
    }
    return null;
  }
}
