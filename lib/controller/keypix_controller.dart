import 'package:chavespix/data/enums.dart';

import 'cpf_controller.dart';
import 'package:chavespix/data/utils.dart';

class KeyPixController {
  static bool getValidatedKey(String key, String value) {
    TypeKeyPixEnum nameKey = typeKeyPixEnum(key);
    switch (nameKey) {
      case TypeKeyPixEnum.CPF:
        return validateCPFkey(valueCpf: value);
      case TypeKeyPixEnum.PHONE:
        return validatePhoneKey(valuePhone: value);
      case TypeKeyPixEnum.EMAIL:
        return validateEmailKey(valueEmail: value);
      case TypeKeyPixEnum.RANDOM_KEY:
        return validateRandomKey(valueEmail: value);
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

  static bool validatePhoneKey({required String valuePhone}) {
    if (valuePhone.length == 14) {
      return true;
    }
    return false;
  }

  static bool validateEmailKey({required String valueEmail}) {
    if (valueEmail.contains("@")) return valueEmail.regexEmail();
    return false;
  }

  static bool validateRandomKey({required String valueEmail}) {
    return false;
  }
}
