import 'package:favoritecake/core/model/category_model.dart';
import 'package:favoritecake/ui/pages/meal/meal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:favoritecake/core/model/category_model.dart';
import 'package:favoritecake/core/extension/int_extension.dart';

class HomeCategoryItem extends StatelessWidget {

  final CategoryModel _model;

  HomeCategoryItem(this._model);

  @override
  Widget build(BuildContext context) {
    final bgColor = _model.cColor;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.px),
            gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(0.7),
                  bgColor
                ]
            )
        ),
        child: Center(
            child: Text(_model.title, style: Theme.of(context).textTheme.display2.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ))
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MealScreen.routName, arguments: _model);
      }
    );
  }
}
