import 'package:meals/models/meal.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/setting.dart';
import 'package:meals/pages/categoriesmealspage.dart';
import 'package:meals/pages/mealdetailpage.dart';
import 'package:meals/pages/settingpage.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/pages/tabspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Setting setting = Setting();

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Setting setting) {
    setState(() {
      this.setting = setting;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = setting.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = setting.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = setting.isVegan && !meal.isVegan;
        final filterVegetarian = setting.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavortie(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Cook?',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Raleway',
        canvasColor: Color.fromARGB(255, 226, 203, 190),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
      ),
      routes: {
        AppRoutes.homePage: (contxt) => TabsPage(_favoriteMeals),
        AppRoutes.categoriesMeals: (contxt) =>
            CategoriesMealsPage(_availableMeals),
        AppRoutes.mealDetail: (contxt) =>
            MealDetailPage(_toggleFavortie, _isFavorite),
        AppRoutes.settingPage: (contxt) => SettingPage(setting, _filterMeals),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
