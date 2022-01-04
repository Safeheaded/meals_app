import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouritesScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final Meal selectedCategory = favouriteMeals[index];
          return MealItem(
              id: selectedCategory.id,
              title: selectedCategory.title,
              imageUrl: selectedCategory.imageUrl,
              duration: selectedCategory.duration,
              complexity: selectedCategory.complexity,
              affordability: selectedCategory.affordability);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
