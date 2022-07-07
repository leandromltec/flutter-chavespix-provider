/* Desenvolvido por Leandro M. Loureiro */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */
/* Github - https://github.com/leandromltec */

import 'package:flutter/material.dart';

class KeyPix {
  Icon leading;
  String nameKey;
  String? valueKey;
  bool? validKey;
  Widget pageRedirect;

  KeyPix({
    required this.leading,
    required this.nameKey,
    this.valueKey,
    this.validKey = false,
    required this.pageRedirect,
  });
}
