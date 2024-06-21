import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/themeProvider.dart';
import 'package:provider/provider.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        title:  Text("Settings",
            style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary)),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25,top: 10, right: 25),
            padding: const EdgeInsets.all(25),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dark mode
                Text('Dark Mode',
                  style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary),
                ),
                //Switch
                CupertinoSwitch(
                  value: Provider.of<Themeprovider>(context,listen: false).isDarkMode,

                    onChanged: (value)=>Provider.of<Themeprovider>(context,listen: false)
                        .toggleTheme(),

                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
