import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_title.dart';
import 'package:food_delivery_app/views/loginPage.dart';
import 'package:food_delivery_app/views/settingPage.dart';

import '../services/auth/auth_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  void Logout() {

   final auth = AuthService();
    auth.signOut();
  }
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(25.0),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          ),
          //Home list title
          MyDrawerTitle(
              text: "H O M E",
              icon: Icons.home,
              onTap:()=> Navigator.pop(context),

          ),
          MyDrawerTitle(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
            },

          ),
          MyDrawerTitle(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: (){
            widget.Logout();
            Navigator.pop(context);

            },

          ),

        ],
      ),
    );
  }
}
