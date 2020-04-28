import 'package:favoritecake/core/model/meal_model.dart';
import 'package:favoritecake/core/sevices/meal_request.dart';
import 'package:favoritecake/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];
  FilterViewModel _filter;

  List<MealModel> get meals {
    return _meals.where((meal){
      if (_filter.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filter.isVegan && !meal.isVegan) return false;
      if (_filter.isVegetarian && !meal.isVegetarian) return false;
      if (_filter.isLactoseFree && !meal.isLactoseFree) return false;
      return true;
    }).toList();
  }

  void updateFilter(FilterViewModel filter) {
    _filter = filter;
  }

  MealViewModel() {
    MealRequest.requestMeals().then((res){
      _meals = res;
      notifyListeners();
    });
  }
}