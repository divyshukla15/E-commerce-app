import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(accountName: Text("Divy Shukla"),
             accountEmail: Text("divyshukla15@gmail.com"),
             currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/undraw_Authentication_re_svpt.png"),
             ),),
             
          )
          ,ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Profile",
            textScaleFactor: 1.2,
            //style: TextStyle(
            //color: Colors.white),
                    )        )
          ,ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text("Settings",
            textScaleFactor: 1.2,
            //style: TextStyle(
            //color: Colors.white),
            )
          )
          ,ListTile(
            leading: Icon(CupertinoIcons.phone_arrow_down_left),
            title: Text("contact",
            textScaleFactor: 1.2,
            //style: TextStyle(
            //color: Colors.white),
            )
          )
        ],
      ),
    );
  }
}