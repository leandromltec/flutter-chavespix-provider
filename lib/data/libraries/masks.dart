/* Desenvolvido por Leandro M. Loureiro */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */
/* Github - https://github.com/leandromltec */

library mask;

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var cpfMask = MaskTextInputFormatter(mask: "###.###.###-##");
var phoneMask = MaskTextInputFormatter(mask: "(##)#####-####");
var emptyMask = MaskTextInputFormatter(mask: "");
