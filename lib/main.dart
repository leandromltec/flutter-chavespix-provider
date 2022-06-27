import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/home_page.dart';
import 'repository/keypix_repository.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => KeysRepository(), child: KeyPixApp()));
}

class KeyPixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeyPixHome(
        title: "Chaves Pix Provider",
      ),
    );
  }
}
