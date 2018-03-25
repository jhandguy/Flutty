import 'package:flutter/material.dart';
import 'package:flutty/widget/user_list/user_list_item.dart';
import 'package:flutty/model/user.dart';

class UserListWidget extends StatefulWidget {
  UserListWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserListWidgetState createState() => new _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  var _users = <User>[];

  void _getUsers() async {
    final stream = await fetchUsers();
    stream.listen((user) => setState(() => _users.add(user)));
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: _users.map((user) => new UserListItemWidget(user)).toList(),
      ),
    );
  }
}