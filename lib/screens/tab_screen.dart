import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 final List<Widget> _pages = [
   const CategoriesScreen(),
   const FavouritesScreen()
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
        title: const Text('Meals'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.star,
              ),
              label: 'Favourites'
          ),
        ],

      ),
    );
  }
}
