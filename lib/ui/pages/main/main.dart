import 'package:favoritecake/core/sevices/meal_request.dart';
import 'package:favoritecake/ui/pages/main/initialize_items.dart';
import 'package:favoritecake/ui/pages/main/main_drawer.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {

  static const String routeName = "/";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: MainDrawer(),
    );
  }
}
