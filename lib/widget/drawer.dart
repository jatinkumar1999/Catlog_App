import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String imageurl =
      "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTc5ODc1NTM4NjMyOTc2Mzcz/gettyimages-693134468.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: const Text("Jatin Kumar"),
              accountEmail: const Text("bhardwajjatin1999@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.home),
            title: Text(
              "Home",
              textScaleFactor: 1.5,
            ),
          ),
          const ListTile(
            leading: FaIcon(CupertinoIcons.profile_circled),
            title: Text(
              "Profile",
              textScaleFactor: 1.5,
            ),
          ),
          const ListTile(
            leading: FaIcon(CupertinoIcons.phone_arrow_right),
            title: Text(
              "contact",
              textScaleFactor: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
