/* Desenvolvido por Leandro M. Loureiro */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */
/* Github - https://github.com/leandromltec */

import '../data/enums.dart';
import '../data/utils.dart';

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
        return validateRandomKey(valueRandom: value);
      default:
        return false;
    }
  }

  static bool validateCPFkey({required String valueCpf}) {
    if (valueCpf.length == 14) {
      return valueCpf.validateCpf(cpf: valueCpf);
    }
    return false;
  }

  static bool validatePhoneKey({required String valuePhone}) {
    if (valuePhone.length == 14) {
      return valuePhone.regexPhoneKey();
    }
    return false;
  }

  static bool validateEmailKey({required String valueEmail}) {
    if (valueEmail.contains("@")) return valueEmail.regexEmail();
    return false;
  }

  static bool validateRandomKey({required String valueRandom}) {
    if (valueRandom.length == 36) return valueRandom.regexRandomKey();
    return false;
  }
}
