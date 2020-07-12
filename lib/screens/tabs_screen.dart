import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_sreen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen({Key key, this.favouriteMeals}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(
          favouriteMeals: widget.favouriteMeals,
        ),
        'title': 'Favourites'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
