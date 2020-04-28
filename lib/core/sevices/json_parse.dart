import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:favoritecake/core/model/category_model.dart';
import 'package:favoritecake/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString("assets/json/category.json");
    final result = json.decode(jsonString);
    final category = result["category"];
    List<CategoryModel> models = [];
    for (var item in category) {
      models.add(CategoryModel.fromJson(item));
    }
    return models;
  }


  static Future<List<MealModel>> getMealData() async {
    final jsonString = await rootBundle.loadString("assets/json/meal.json");
    final result = json.decode(jsonString);
    final category = result["meal"];
    List<MealModel> models = [];
    for (var item in category) {
      models.add(MealModel.fromJson(item));
    }
    return models;
  }
}