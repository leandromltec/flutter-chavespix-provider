import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/libraries/strings.dart' as strings;
import '../../repository/keypix_repository.dart';

class BtnRegisterKey extends StatefulWidget {
  final String validateKeySelected;
  final String typedKey;
  final bool correctKey;

  BtnRegisterKey(this.validateKeySelected, this.typedKey, this.correctKey);

  bool hideButton = false;

  @override
  State<BtnRegisterKey> createState() => _BtnRegisterKeyState();
}

class _BtnRegisterKeyState extends State<BtnRegisterKey> {
  @override
  void initState() {
    validateButton(widget.correctKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.hideButton == false
            ? Container(
                width: double.infinity,
                height: 50,
                color: Color(0xFF6200FF),
                margin: EdgeInsets.only(left: 25, right: 25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFF6200FF)),
                    child: Text(
                      strings.btnRegisterKey,
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: (validateButton(widget.correctKey))))
            : Container(),
      ],
    );
  }

  updateKey(BuildContext context) {
    Provider.of<KeysRepository>(context, listen: false)
        .validateKeys(widget.validateKeySelected, widget.typedKey);
    setState(() {
      widget.hideButton = true;
    });
  }

  dynamic validateButton(bool correctKey) {
    if (correctKey)
      return () {
        updateKey(context);
      };
    else {
      setState(() {
        widget.hideButton = false;
      });
      return null;
    }
  }
}
