import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  final Widget body;

  MasterPage({required this.body});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200FF),
          title: Text(
            "Chaves Pix",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: widget.body);
  }
}
