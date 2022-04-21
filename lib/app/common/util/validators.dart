import '../../common/util/exports.dart';

class Validators {
  const Validators._();

  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateTEmpty<T>(T? v) {
    if (v == null) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.isEmpty) {
      return Strings.emailCantBeEmpty;
    } else if (!GetUtils.isEmail(v)) {
      return Strings.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (v.length != 10) {
      return Strings.enterValidNumber;
    } else {
      return null;
    }
  }

  static String? validateEmailPhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (GetUtils.isNumericOnly(v)) {
      return validatePhone(v);
    } else {
      return validateEmail(v);
    }
  }

  static String? validatePassword(String? v) {
    if (v!.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8) {
      return Strings.passwordValidation;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v, String password) {
    if (v!.isEmpty || password.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8 || password.length < 8 || v != password) {
      return Strings.confirmPasswordValidation;
    } else {
      return null;
    }
  }

  static String? validateCheckbox({
    bool v = false,
    String error = Strings.checkboxValidation,
  }) {
    if (!v) {
      return error;
    } else {
      return null;
    }
  }

  static bool isNumber(String char) {
    for (int i = 0; i <= 9; i++) {
      if (char == i.toString()) {
        return true;
      }
    }

    return false;
  }

  static String validBdPhone(String value) {
    if (!value.startsWith("+880")) {
      return "+880";
    }
    if (!Validators.isNumber(value.getLastLetter())) {
      return value.removeLastLetter();
    }
    if (value.length == 5 && value.getLastLetter() != "1") {
      return value.removeLastLetter();
    }
    if (value.length == 6 && ["0", "2"].contains(value.getLastLetter())) {
      return value.removeLastLetter();
    }

    return value;
  }

  static bool isLoginCredValid(String username, String password) {
    return username.isNotEmpty && password.isNotEmpty;
  }
}
