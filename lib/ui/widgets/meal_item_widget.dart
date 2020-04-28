import 'package:favoritecake/core/model/meal_model.dart';
import 'package:favoritecake/core/viewmodel/favorite_meal_view_model.dart';
import 'package:favoritecake/ui/pages/detail/detail.dart';
import 'package:favoritecake/ui/widgets/operation_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:favoritecake/core/extension/int_extension.dart';
import 'package:favoritecake/core/extension/double_extension.dart';
import 'package:provider/provider.dart';


class MealItemWidget extends StatelessWidget {

  final MealModel _meal;

  MealItemWidget(this._meal);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.px))),
      elevation:4.px,
      margin: EdgeInsets.all(10.px),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            getInfo(),
            getOperation()
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: _meal);
        },
      ),
    );
  }

  Widget getInfo() {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.px),
                topRight: Radius.circular(12.px)
            ),
            child: Image.network(_meal.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover)
        ),
        Positioned(
          right: 10.px,
          bottom: 20.px,
          child: Container(
            width: 240.px,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(Radius.circular(10.px))
            ),
            padding: EdgeInsets.all(10.px),
            child: Text(_meal.title, style: TextStyle(color: Colors.white).copyWith(
              fontSize: 24.px,
              fontWeight: FontWeight.bold
            )),
          ),
        )
      ],
    );
  }


  Widget getOperation() {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          OperationItemWidget(Icon(Icons.schedule), "${_meal.duration} min"),
          OperationItemWidget(Icon(Icons.restaurant), "${_meal.complexStr}"),
          getFavorOper(_meal)
        ],
      ),
    );
  }

  Widget getFavorOper(MealModel meal) {
    return Consumer<FavoriteMealViewModel>(
      builder: (context,favorMeal,child) {
        final isFavor = favorMeal.isFavor(meal);
        final color = isFavor ? Colors.red : Colors.black;
        final title = isFavor ? "已收藏" : "为收藏";
        final iconData = isFavor ? Icons.favorite : Icons.favorite_border;
        return GestureDetector(
          child: OperationItemWidget(Icon(iconData, color: color), title, titleColor: color,),
          onTap: () {
            favorMeal.handleMeal(meal);
          },
        );
      }
    );

  }

}

