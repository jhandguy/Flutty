import 'package:flutter/material.dart';
import 'package:flutty/model/user.dart';
import 'package:flutty/widget/user_detail/user_detail.dart';

class UserListItemWidget extends StatefulWidget {
  UserListItemWidget(this.user);

  final User user;

  @override
  _UserListItemState createState() => new _UserListItemState();
}

class _UserListItemState extends State<UserListItemWidget> {

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundImage: new NetworkImage(widget.user.smallpicture)
      ),
      title: new Text(widget.user.fullName()),
      subtitle: new Text(widget.user.username),
      trailing: new IconButton(
        icon: new Icon(
          widget.user.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.user.isFavorite ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            widget.user.isFavorite = !widget.user.isFavorite;
          });
        }
      ),
      onTap: () => _pushUserDetailPage(),
    );
  }

  void _pushUserDetailPage() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new UserDetailWidget(widget.user);
        }
      )
    );
  }
}