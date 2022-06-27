import 'dart:collection';

import 'package:chavespix/presentation/pages/default_page.dart';
import 'package:flutter/material.dart';

import '../core/libraries/strings.dart' as strings;
import '../core/libraries/masks.dart' as mask;
import '../model/keypix_model.dart';

class KeysRepository extends ChangeNotifier {
  final List<KeyPix> _keys = [];

  UnmodifiableListView<KeyPix> get keys => UnmodifiableListView(_keys);

  void validateKeys(String keySelected, String typedKey) {
    final key = _keys.firstWhere((key) => key.nameKey == keySelected);
    key.validKey = true;
    key.valueKey = typedKey;

    notifyListeners();
  }

  KeysRepository() {
    _keys.addAll([
      KeyPix(
          leading: Icon(Icons.person, color: Color(0xFFD50000)),
          nameKey: strings.nameKeyCPFCNPJ,
          pageRedirect: PageDefaultPix(
            hintText: strings.cpfCnpjHintText,
            keyName: strings.nameKeyCPFCNPJ,
            keyboardType: TextInputType.number,
            mask: mask.cpfMask,
          )),
      KeyPix(
          leading: Icon(Icons.smartphone_rounded, color: Color(0xFFD50000)),
          nameKey: strings.nameKeyCellPhone,
          pageRedirect: PageDefaultPix(
            hintText: strings.cellPhoneHintText,
            keyName: strings.nameKeyCellPhone,
            keyboardType: TextInputType.number,
            mask: mask.phoneMask,
          )),
      KeyPix(
          leading: Icon(Icons.email, color: Color(0xFFD50000)),
          nameKey: strings.nameKeyEmail,
          pageRedirect: PageDefaultPix(
            hintText: strings.emailHintText,
            keyName: strings.nameKeyEmail,
            keyboardType: TextInputType.emailAddress,
            mask: mask.emptyMask,
          )),
      KeyPix(
          leading: Icon(Icons.vpn_key, color: Color(0xFFD50000)),
          nameKey: strings.nameKeyRandomKey,
          pageRedirect: PageDefaultPix(
            hintText: strings.randomKeyHintText,
            keyName: strings.nameKeyRandomKey,
            keyboardType: TextInputType.text,
            mask: mask.emptyMask,
            suffixIcon:
                IconButton(icon: Icon(Icons.paste_rounded), onPressed: () {}),
          )),
    ]);
  }
}
