import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesPage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No favorite meals.'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (contxt, index) => MealItem(favoriteMeals[index]),
      );
    }
  }
}
