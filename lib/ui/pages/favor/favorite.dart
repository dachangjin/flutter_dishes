import 'package:favoritecake/core/viewmodel/favorite_meal_view_model.dart';
import 'package:favoritecake/ui/widgets/meal_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body:Consumer<FavoriteMealViewModel>(
        builder: (context,favorMealModel,child) {
          if (favorMealModel.meals.length == 0) {
            return Center(
              child: Text("暂无收藏",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
            );
          }
          return ListView.builder(
            itemCount: favorMealModel.meals.length,
            itemBuilder: (context, index) {
              return MealItemWidget(favorMealModel.meals[index]);
            }
          );
        },
      )
    );
  }
}
