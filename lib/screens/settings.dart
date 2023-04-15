import 'package:flutter/material.dart';
import 'package:foodapp/widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const settingScreen = '/setting-screen';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Setting Screen'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text(
          'Setting Screens'
        ),
      ),
    );
  }
}
