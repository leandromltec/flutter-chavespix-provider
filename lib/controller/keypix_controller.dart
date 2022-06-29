import 'cpf_controller.dart';
import 'package:chavespix/core/utils.dart';

class KeyPixController {
  static bool getValidatedKey(String key, String value) {
    switch (key) {
      case "CPF":
        return validateCPFkey(valueCpf: value);
      case "Celular":
        return validatePhone(valuePhone: value);
      case "E-mail":
        return validateEmail(valueEmail: value);
      default:
        return false;
    }
  }

  static bool validateCPFkey({required String valueCpf}) {
    if (valueCpf.length == 14) {
      return CPFController.isValid(cpf: valueCpf);
    }
    return false;
  }

  static bool validatePhone({required String valuePhone}) {
    if (valuePhone.length == 14) {
      return true;
    }
    return false;
  }

  static bool validateEmail({required String valueEmail}) {
    if (valueEmail.contains("@")) return valueEmail.regexEmail();
    return false;
  }
}
