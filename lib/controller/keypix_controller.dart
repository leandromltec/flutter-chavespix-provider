import 'cpf_controller.dart';

class KeyPixController {
  static bool getValidatedKey(String key, String value) {
    switch (key) {
      case "CPF":
        return validateCPFkey(valueCpf: value);
      case "Celular":
        return true;
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
}
