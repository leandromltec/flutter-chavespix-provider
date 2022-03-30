import 'package:flutter/material.dart';

import '../core/libraries/strings.dart' as strings;
import 'master_page.dart';
import 'widgets/btn_register_key.dart';

class KeyPixCellPhonePage extends StatefulWidget {
  @override
  State<KeyPixCellPhonePage> createState() => _KeyPixCellPhonePageState();
}

class _KeyPixCellPhonePageState extends State<KeyPixCellPhonePage> {
  @override
  Widget build(BuildContext context) {
    return MasterPage(
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(hintText: strings.cellPhoneHintText),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          BtnRegisterKey()
        ],
      ),
    ));
  }
}
