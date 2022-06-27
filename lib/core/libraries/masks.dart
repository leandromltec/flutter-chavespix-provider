library mask;

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var cpfMask = MaskTextInputFormatter(mask: "###.###.###-##");
var phoneMask = MaskTextInputFormatter(mask: "(##)#####-####");
var emptyMask = MaskTextInputFormatter(mask: "");
