class ValidationUtils {
  static bool hasUpperCase(String value) => RegExp(r'[A-Z]').hasMatch(value);

  static bool hasNumber(String value) => RegExp(r'\d').hasMatch(value);

  static bool hasSpecialChar(String value) => RegExp(
    r'[!@#$&*~%^()\-_=+{}\[\]:;"'
    r"'"
    r'<>,./?\\|]',
  ).hasMatch(value);

  static bool hasMinLength(String value) => value.length >= 6;

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? strongPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final containsUpper = hasUpperCase(value);
    final containsNumber = hasNumber(value);
    final containsSpecial = hasSpecialChar(value);
    final meetsMinLen = hasMinLength(value);

    if (!containsUpper || !containsNumber || !containsSpecial || !meetsMinLen) {
      return 'Password does not meet the required conditions';
    }

    return null;
  }
}
