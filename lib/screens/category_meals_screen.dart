import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final Meal selectedCategory = categoryMeals[index];
          return MealItem(
              id: selectedCategory.id,
              title: selectedCategory.title,
              imageUrl: selectedCategory.imageUrl,
              duration: selectedCategory.duration,
              complexity: selectedCategory.complexity,
              affordability: selectedCategory.affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
