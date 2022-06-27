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
