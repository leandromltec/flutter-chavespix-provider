import 'package:chavespix/controller/keypix_controller.dart';

import 'master_page.dart';

import '../widgets/btn_register_key.dart';

import 'package:flutter/material.dart';



class PageDefaultPix extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final String keyName;
  final IconButton? suffixIcon;
  final mask;

  PageDefaultPix(
      {required this.hintText,
      required this.keyboardType,
      required this.keyName,
      this.suffixIcon,
      this.mask});

  String typedKey = "";
  bool correctKey = false;

  @override
  State<PageDefaultPix> createState() => _PageDefaultPixState();
}

class _PageDefaultPixState extends State<PageDefaultPix> {
  @override
  void initState() {
    setState(() {
      widget.correctKey = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterPage(
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              inputFormatters: [widget.mask],
              decoration: InputDecoration(
                  labelText: widget.keyName,
                  hintText: widget.hintText,
                  suffixIcon: widget.suffixIcon),
              keyboardType: widget.keyboardType,
              textAlign: TextAlign.left,
              onChanged: (value) {
                bool validatedKey =
                    KeyPixController.getValidatedKey(widget.keyName, value);
                setState(() {
                  if (validatedKey) {
                    widget.typedKey = value;
                    widget.correctKey = true;
                  } else {
                    widget.typedKey = "";
                    widget.correctKey = false;
                  }
                });
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          BtnRegisterKey(widget.keyName, widget.typedKey, widget.correctKey)
        ],
      ),
    ));
  }
}
