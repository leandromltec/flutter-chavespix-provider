/* Desenvolvido por Leandro M. Loureiro */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */
/* Github - https://github.com/leandromltec */
extension BoolUtils on String {
  bool regexEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool regexRandomKey() => RegExp(
          r"[a-eA-E0-9]{8}[-][a-eA-E0-9]{4}[-][a-eA-E0-9]{4}[-][a-eA-E0-9]{4}[-][0-9]{12}")
      .hasMatch(this);

  bool regexPhoneKey() =>
      RegExp(r"(\(?\d{2}\?\s)?(\d{5}\-\d{4})").hasMatch(this);

  bool validateCpf({required String cpf}) {
    if (cpf == "") return false;

    // Obter somente os números do CPF
    var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CPF possui 11 dígitos
    if (numeros.length != 11) return false;

    // Testar se todos os dígitos do CPF são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos =
        numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digitos[10 - i] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digitos[9] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digitos[11 - i] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digitos[10] != dv2) return false;

    return true;
  }
}
