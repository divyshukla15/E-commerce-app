import 'package:e_coommerce_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/login_page.dart' as globals;

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sc(),
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: lg()),
              accountName: Text(
                globals.Name,
                style: TextStyle(
                    color: dg(),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Simple"),
              ),
              accountEmail: Text(
                globals.Email,
                style: TextStyle(
                    color: dg(),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Simple"),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage:
                    AssetImage("assets/undraw_Authentication_re_svpt.png"),
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: dg(),
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: dg(), fontFamily: "Simple"),
                //style: TextStyle(
                //color: Colors.white),
              )),
          ListTile(
              leading: Icon(CupertinoIcons.settings, color: dg()),
              title: Text(
                "Settings",
                textScaleFactor: 1.2,
                style: TextStyle(color: dg(), fontFamily: "Simple"),
                //style: TextStyle(
                //color: Colors.white),
              )),
          ListTile(
              leading: Icon(CupertinoIcons.phone_arrow_down_left, color: dg()),
              title: Text(
                "Contact",
                textScaleFactor: 1.2,
                style: TextStyle(color: dg(), fontFamily: "Simple"),
                //style: TextStyle(
                //color: Colors.white),
              ))
        ],
      ),
    );
  }
}
