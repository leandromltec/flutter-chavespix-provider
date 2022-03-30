import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/libraries/strings.dart' as strings;
import 'presentation/key_pix_cpf_page.dart';
import 'presentation/master_page.dart';
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

class KeyPixHome extends StatefulWidget {
  KeyPixHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _KeyPixHomeState createState() => _KeyPixHomeState();
}

class _KeyPixHomeState extends State<KeyPixHome> {
  @override
  Widget build(BuildContext context) {
    return MasterPage(
      body: Consumer<KeysRepository>(
        builder: (context, repository, child) => Container(
          child: ListView.separated(
              itemCount: repository.keys.length,
              separatorBuilder: (_, index) => const Divider(
                    color: Color(0xFF6200FF),
                  ),
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    repository.keys[index].nameKey,
                    style: TextStyle(color: Color(0xFF6200FF)),
                  ),
                  subtitle: repository.keys[index].validates == false
                      ? Text(strings.labelKeyNotRegistered)
                      : Text(repository.keys[index].key!),
                  leading: repository.keys[index].leading,
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                repository.keys[index].pageRedirect));
                  },
                );
              }),
        ),
      ),
    );
  }
}
