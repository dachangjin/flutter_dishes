import 'package:favoritecake/ui/pages/filter/FilterScreen.dart';
import 'package:flutter/material.dart';

import 'package:favoritecake/core/extension/int_extension.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getDrawer(context);
  }

  Widget getDrawer(BuildContext context) {
    return Container(
      width: 250.px,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          getDrawerTitle(context),
          getListTile(context, Icon(Icons.restaurant), "进餐", (){
            Navigator.of(context).pop();
          }),
          getListTile(context, Icon(Icons.settings), "过滤", (){
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }


  Widget getDrawerTitle(BuildContext context) {
    return Container(
      height: 120.px,
      color: Colors.amber,
      alignment: Alignment(0, 0.5),
      child: Text("开始动手", style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold))
    );
  }

  Widget getListTile(BuildContext context,Widget icon,String title, Function tap) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
      leading: icon,
      title: Text(title,style: Theme.of(context).textTheme.display2.copyWith(fontWeight: FontWeight.bold)),
      onTap: tap,
    );
  }
}
