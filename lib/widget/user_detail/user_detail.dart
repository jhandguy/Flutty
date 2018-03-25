import 'package:flutter/material.dart';
import 'package:flutty/model/user.dart';
import 'package:flutty/widget/user_detail/user_detail_category.dart';
import 'package:flutty/widget/user_detail/user_detail_item.dart';

class UserDetailWidget extends StatefulWidget {
  UserDetailWidget(this.user);

  final User user;

  @override
  _UserDetailState createState() => new _UserDetailState();
}

class _UserDetailState extends State<UserDetailWidget> {
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text(widget.user.fullName()),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image(
                      image: new NetworkImage(widget.user.bigpicture),
                      fit: BoxFit.cover,
                      height: 256.0
                    ),
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[const Color(0x60000000), const Color(0x00000000)],
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new UserDetailCategoryWidget(
                  icon: Icons.phone,
                  children: <Widget>[
                    new UserDetailItemWidget(
                      icon: Icons.message,
                      tooltip: 'Send Message',
                      lines: [widget.user.phone, 'Phone'],
                      onPressed: () => print('TODO')
                    ),
                    new UserDetailItemWidget(
                      icon: Icons.message,
                      tooltip: 'Send Message',
                      lines: [widget.user.cell, 'Cell'],
                      onPressed: () => print('TODO')
                    )
                  ],
                ),
                new UserDetailCategoryWidget(
                  icon: Icons.contact_mail,
                  children: <Widget>[
                    new UserDetailItemWidget(
                      icon: Icons.email,
                      tooltip: 'Send Email',
                      lines: [widget.user.email, 'Email'],
                      onPressed: () => print('TODO')
                    )
                  ],
                ),
                new UserDetailCategoryWidget(
                  icon: Icons.location_on,
                  children: <Widget>[
                    new UserDetailItemWidget(
                      icon: Icons.map,
                      tooltip: 'See Map',
                      lines: [widget.user.fullAddress(), 'Address'],
                      onPressed: () => print('TODO')
                    )
                  ],
                ),
                new UserDetailCategoryWidget(
                  icon: Icons.today,
                  children: <Widget>[
                    new UserDetailItemWidget(
                      lines: [widget.user.birthday, 'Birthday'],
                    )
                  ],
                )
              ]),
            )
          ],
        )
      );
    }
}