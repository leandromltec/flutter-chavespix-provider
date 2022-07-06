import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/libraries/strings.dart' as strings;
import '../../repository/keypix_repository.dart';

class BtnRegisterKey extends StatefulWidget {
  final String validateKeySelected;
  final String typedKey;
  final bool correctKey;

  BtnRegisterKey(this.validateKeySelected, this.typedKey, this.correctKey);

  bool blockedButton = false;

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
        widget.blockedButton == false
            ? Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(left: 25, right: 25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFFD50000)),
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
      widget.blockedButton = true;
    });
  }

  dynamic validateButton(bool correctKey) {
    if (correctKey)
      return () async {
        updateKey(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        await Future.delayed(Duration(seconds: 5), () {
          Navigator.pop(context);
        });
      };
    else {
      setState(() {
        widget.blockedButton = false;
      });
      return null;
    }
  }

  var snackBar = SnackBar(
    content: Text("Chave cadastrada com Sucesso !"),
    action: SnackBarAction(
      label: "Redirecionando",
      onPressed: () {},
    ),
  );
}
