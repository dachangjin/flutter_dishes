import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:favoritecake/core/model/category_model.dart';
import 'package:favoritecake/core/viewmodel/meal_view_model.dart';
import 'package:favoritecake/ui/widgets/meal_item_widget.dart';


class MealScreen extends StatelessWidget {
  static const String routName = "/meal";

  @override
  Widget build(BuildContext context) {

    final categoty = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("${categoty.title}"),
      ),
      body: MealContent(),
    );
  }
}


class MealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Consumer<MealViewModel>(
      builder: (ctx, mealViewModel, child) {
        final meals = mealViewModel.meals.where((meal) => meal.categories.contains(category.id)).toList();
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealItemWidget(meals[index]);
            }
        );
      },
    );
  }
}

