import 'dart:collection';

import 'package:flutter/material.dart';

import '../core/libraries/strings.dart' as strings;
import '../model/keypix_model.dart';
import '../presentation/key_pix_cell_phone_page.dart';
import '../presentation/key_pix_cpf_page.dart';
import '../presentation/key_pix_email_page.dart';
import '../presentation/key_pix_random_key_page.dart';

class KeysRepository extends ChangeNotifier {
  final List<KeyPix> _keys = [];

  UnmodifiableListView<KeyPix> get keys => UnmodifiableListView(_keys);

  void validateKeys(KeyPix key) {
    keys.add(key);
    notifyListeners();
  }

  KeysRepository() {
    _keys.addAll([
      KeyPix(
          leading: Icon(Icons.person, color: Color(0xFF6200FF)),
          nameKey: strings.nameKeyCPFCNPJ,
          pageRedirect: KeyPixCPFCNPJPage()),
      KeyPix(
          leading: Icon(Icons.smartphone_rounded, color: Color(0xFF6200FF)),
          nameKey: strings.nameKeyCellPhone,
          pageRedirect: KeyPixCellPhonePage()),
      KeyPix(
          leading: Icon(
            Icons.email,
            color: Color(0xFF6200FF),
          ),
          nameKey: strings.nameKeyEmail,
          pageRedirect: KeyPixEmailPage()),
      KeyPix(
          leading: Icon(Icons.vpn_key, color: Color(0xFF6200FF)),
          nameKey: strings.nameKeyRandomKey,
          pageRedirect: PixKeyRandomKeyPage())
    ]);
  }
}
