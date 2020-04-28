import 'package:favoritecake/core/model/meal_model.dart';
import 'package:favoritecake/core/viewmodel/favorite_meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:favoritecake/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {

  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20.px),
          child: Column(
            children: <Widget>[
              getImage(meal),
              getTitle(context, "制作材料"),
              getMaterial(context, meal),
              getTitle(context, "步骤"),
              getSteps(context, meal),
            ],
          ),
        )
      ),
      floatingActionButton: Consumer<FavoriteMealViewModel>(
        builder: (context,favorMealMV, child) {
          final isFavor = favorMealMV.isFavor(meal);
          final icon = isFavor ? Icon(Icons.favorite) : Icon(
              Icons.favorite_border);
          return FloatingActionButton(
              child: icon,
              onPressed: () {
                favorMealMV.handleMeal(meal);
              }
          );
        })
    );
  }
  
  Widget getImage(MealModel meal) {
    return Container(
      width: double.infinity,
      child: Image.network(meal.imageUrl)
    );
  }
  
  Widget getTitle(BuildContext ctx,String title) {
    return Container(
      margin: EdgeInsets.all(15.px),
      child: Text(title, style: Theme.of(ctx).textTheme.display3.copyWith(color: Colors.black, fontWeight: FontWeight.bold))
    );
  }


  Widget getListInfoWithChild(BuildContext context, {Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      width: MediaQuery.of(context).size.width - 20.px,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.px),
          border: Border.all(color: Colors.black45)
      ),
      child: child
    );
  }
  
  Widget getMaterial(BuildContext context,MealModel meal) {
    return getListInfoWithChild(context,
        child:ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: meal.ingredients.length,
            itemBuilder: (ctx, index) {
              return Card(
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.all(4.px),
                  child: Text(meal.ingredients[index]),
                ),
              );
            }
        ),
    );
  }

  Widget getSteps(BuildContext context,MealModel meal) {
    return getListInfoWithChild(context,
      child:ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          separatorBuilder: (ctx,index){
            return Divider();
          },
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text("#${index + 1}"),
              ),
              title: Text(meal.steps[index]),
            );
          },
          itemCount: meal.steps.length),
    );
  }

}
