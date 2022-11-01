import 'package:meals/models/meal.dart';
import 'package:meals/pages/categoriespage.dart';
import 'package:meals/pages/favoritespage.dart';
import 'package:meals/components/maindrawer.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsPage(this.favoriteMeals);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'title': 'Categories List', 'page': CategoriesPage()},
      {'title': 'My Favorites', 'page': FavoritesPage(widget.favoriteMeals)},
    ];
  }

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
