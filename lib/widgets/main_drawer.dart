import 'package:flutter/material.dart';
import 'package:foodapp/screens/settings.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  ListTile buildListTile(String title,IconData icon,VoidCallback handler) {
    return ListTile(
      leading:  Icon(
        icon,
        size: 26,
      ),
      title:  Text(
        title,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
        ),
      ),
      onTap: handler
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child:  Text(
                'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          const SizedBox(height: 20,),
           buildListTile(
               'Meals',
               Icons.restaurant,
               (){
                 Navigator.pushNamed(context, '/');
               }
           ),
          buildListTile(
              'Settings',
              Icons.settings,
              (){
                Navigator.pushNamed(context, SettingsScreen.settingScreen);
              }
          ),
        ],
      ),
    );
  }


}
