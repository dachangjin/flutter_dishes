import 'package:favoritecake/core/router/router.dart';
import 'package:favoritecake/core/viewmodel/favorite_meal_view_model.dart';
import 'package:favoritecake/core/viewmodel/filter_view_model.dart';
import 'package:favoritecake/core/viewmodel/meal_view_model.dart';
import 'package:favoritecake/ui/shared/app_theme.dart';
import 'package:favoritecake/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FilterViewModel>(create: (_) => FilterViewModel()),
        ChangeNotifierProvider<MealViewModel>(create: (_) => MealViewModel()),
        ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
          create: (_) => MealViewModel(),
          update: (_, filterVM, mealVM) {
            mealVM.updateFilter(filterVM);
            return mealVM;
          },
        ),
        ChangeNotifierProvider<FavoriteMealViewModel>(create: (_) => FavoriteMealViewModel()),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      theme: Apptheme.normalTheme,
      initialRoute: Router.initialRoute,
      routes: Router.routes,
      onGenerateRoute: Router.genarateRout,
      onUnknownRoute: Router.unknownRoute,
    );
  }
}

