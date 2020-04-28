import 'package:favoritecake/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class FavoriteMealViewModel extends ChangeNotifier {
  final List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals;
  }

  bool isFavor(MealModel meal) {
    return _meals.contains(meal);
  }

  void addMeal(MealModel meal) {
    _meals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    _meals.remove(meal);
    notifyListeners();
  }

  void handleMeal(MealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}