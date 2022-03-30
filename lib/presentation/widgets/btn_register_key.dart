import 'package:flutter/material.dart';
import '../../core/libraries/strings.dart' as strings;

class BtnRegisterKey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          onPressed: () {}),
    );
  }
}
