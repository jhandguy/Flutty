import 'package:flutter/material.dart';
import 'package:flutty/users.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutty',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeWidget(title: 'Flutty'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeWidgetState createState() => new _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var _users = <User>[];

  _getUsers() async {
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
        children: _users.map((user) => new UserWidget(user)).toList(),
      ),
    );
  }
}

class UserWidget extends StatefulWidget {
  UserWidget(this.user);

  final User user;

  @override
  _UserState createState() => new _UserState();
}

class _UserState extends State<UserWidget> {

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundImage: new NetworkImage(widget.user.smallpicture)
      ),
      title: new Text(widget.user.username),
      subtitle: new Text(widget.user.email),
      trailing: new IconButton(
        icon: new Icon(
          widget.user.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            widget.user.isFavorite = !widget.user.isFavorite;
          });
        }
      ),
    );
  }
}