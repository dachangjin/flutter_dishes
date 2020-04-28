import 'package:favoritecake/ui/pages/favor/favorite.dart';
import 'package:favoritecake/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
    title: Text("收藏"),
    icon: Icon(Icons.star)
  )
];

final List<Widget> pages = [
  HomeScreen(),
  FavoriteScreen()
];