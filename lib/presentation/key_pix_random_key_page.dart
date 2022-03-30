import 'package:flutter/material.dart';
import '../core/libraries/strings.dart' as strings;
import 'master_page.dart';
import 'widgets/btn_register_key.dart';

class PixKeyRandomKeyPage extends StatefulWidget {
  const PixKeyRandomKeyPage({Key? key}) : super(key: key);

  @override
  State<PixKeyRandomKeyPage> createState() => _PixKeyRandomKeyPageState();
}

class _PixKeyRandomKeyPageState extends State<PixKeyRandomKeyPage> {
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
              decoration: InputDecoration(hintText: strings.randomKeyHintText),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          BtnRegisterKey(null)
        ],
      ),
    ));
  }
}
