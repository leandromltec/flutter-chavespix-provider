import 'package:provider/provider.dart';

import '../../repository/keypix_repository.dart';

import 'master_page.dart';
import 'package:flutter/material.dart';
import '../../data/libraries/strings.dart' as strings;

class KeyPixHome extends StatefulWidget {
  KeyPixHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _KeyPixHomeState createState() => _KeyPixHomeState();
}

class _KeyPixHomeState extends State<KeyPixHome> {
  @override
  Widget build(BuildContext context) {
    final listKeys = Provider.of<KeysRepository>(context, listen: true).keys;

    return MasterPage(
      body: Consumer<KeysRepository>(
        builder: (context, repository, child) => Container(
          child: ListView.separated(
              itemCount: repository.keys.length,
              separatorBuilder: (_, index) => const Divider(
                    color: Color(0xFFD50000),
                  ),
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    listKeys[index].nameKey,
                    style: TextStyle(color: Color(0xFFD50000)),
                  ),
                  subtitle: listKeys[index].validKey == false
                      ? Text(strings.labelKeyNotRegistered)
                      : Text(repository.keys[index].valueKey!),
                  leading: repository.keys[index].leading,
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                listKeys[index].pageRedirect));
                  },
                );
              }),
        ),
      ),
    );
  }
}
