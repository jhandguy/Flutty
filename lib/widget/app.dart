import 'package:flutter/material.dart';
import 'package:flutty/widget/user_list/user_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutty',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        platform: Theme.of(context).platform
      ),
      home: new UserListWidget(title: 'Flutty'),
    );
  }
}