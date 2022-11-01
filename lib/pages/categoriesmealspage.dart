import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/components/meal_item.dart';
import 'package:flutter/material.dart';

class CategoriesMealsPage extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsPage(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (contxt, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
