import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_manager/binder/models/settings_controller.dart';
import 'package:binder/binder.dart';
import 'package:state_manager/mobx/models/settings_store.dart';

class MobXPage extends StatefulWidget {
  MobXPage({Key? key}) : super(key: key);

  @override
  _MobXPageState createState() => _MobXPageState();
}

class _MobXPageState extends State<MobXPage> {
  @override
  Widget build(BuildContext context) {
    final settings = GetIt.I.get<SettingsStore>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.colorSelected.color,
        title: Text("MobX And GetIt Screen"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You select ${settings.colorSelected.name}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/binder/settings');
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
