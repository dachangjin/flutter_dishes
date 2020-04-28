import 'package:favoritecake/ui/pages/detail/detail.dart';
import 'package:favoritecake/ui/pages/filter/FilterScreen.dart';
import 'package:favoritecake/ui/pages/main/main.dart';
import 'package:favoritecake/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class Router {

  static final String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (cxt) => MainScreen(),
    MealScreen.routName: (cxt) => MealScreen(),
    DetailScreen.routeName: (ctx) => DetailScreen(),
  };

  static final RouteFactory genarateRout = (settings) {
    if (settings.name == FilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return FilterScreen();
        },
        fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settinfs) {
    return null;
  };
}