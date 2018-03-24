import 'package:flutter/material.dart';
import 'users.dart' as users;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutty',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Flutty'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _users = <users.User>[];

  _getUsers() async {
    final stream = await users.fetch();
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
        children: _users.map((user) => new UserWidget(user)).toList(),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  UserWidget(this.user);
  final users.User user;

  @override
    Widget build(BuildContext context) {
      return new ListTile(
        leading: new CircleAvatar(
          backgroundImage: new NetworkImage(user.smallpicture)
        ),
        title: new Text(user.username),
        subtitle: new Text(user.email),
        trailing: new Icon(
          Icons.favorite_border,
          color: Colors.red
        ),
      );
    }
}
