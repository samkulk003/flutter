import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:meals/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      wasAdded ? 'Meal added as a favorite' : 'Meal removed.'),
                ),
              );
            },
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                      turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                      child: child);
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Ingredients',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final ingredient in meal.ingredients) Text(ingredient),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final steps in meal.steps)
              Text(
                steps,
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
