import 'package:flutter/material.dart';

class drawer_tar extends StatelessWidget {
  final String name;
  final String level;
  const drawer_tar({
    this.name = '',
    this.level = '',
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(this.name),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
            ),
            otherAccountsPictures: <Widget>[
              Ink(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.edit),
                    foregroundColor: Colors.pink,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Ink(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    foregroundColor: Colors.pink,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            onTap: () {},
            title: Text("item 1"),
          ),
          ListTile(
            title: Text("item 2"),
            onTap: () {},
          ),
          ListTile(
            title: Text("item 3"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}