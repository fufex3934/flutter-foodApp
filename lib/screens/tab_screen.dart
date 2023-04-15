import 'package:flutter/material.dart';
import 'package:foodapp/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 final List<Map<String,Object>> _pages = [
   {'page': const CategoriesScreen(),
     'title':'Categories'
   },
   {
     'page': const FavouritesScreen(),
     'title':'Favourites'
   }
 ];

 int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_pages[_selectedPageIndex]['title'] as String),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      body: (_pages[_selectedPageIndex]['page']) as Widget ,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items:  [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.category,
              ),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(
                  Icons.star,
              ),
              label: 'Favourites'
          ),
        ],

      ),
    );
  }
}
