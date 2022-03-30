import 'package:flutter/material.dart';

class KeyPix {
  Icon leading;
  String nameKey;
  String? key;
  bool? validates;
  Widget pageRedirect;

  KeyPix(
      {required this.leading,
      required this.nameKey,
      this.key,
      this.validates = false,
      required this.pageRedirect});
}
