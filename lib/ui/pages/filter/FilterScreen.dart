import 'package:favoritecake/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

import 'package:favoritecake/core/extension/int_extension.dart';
import 'package:provider/provider.dart';


class FilterScreen extends StatelessWidget {

  static final routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤"),
      ),
      body: FilterContent(),
    );
  }
}


class FilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getTitle(context),
        getList()
        
      ],
    );
  }


  Widget getTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20.px),
      child: Text("展示你的选择", style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget getList() {
    return Expanded(
      child: Consumer<FilterViewModel>(
        builder: (ctx,filterVM, child) {
          return ListView(
            children: <Widget>[
              getListTile("无谷蛋白", "展示无谷蛋白食物", filterVM.isGlutenFree, (isOn){
                filterVM.isGlutenFree = isOn;
              }),
              getListTile("不含乳糖", "展示不含乳糖食物", filterVM.isLactoseFree, (isOn){
                filterVM.isLactoseFree = isOn;
              }),
              getListTile("普通素食者", "展示普通素食相关食物", filterVM.isVegetarian, (isOn){
                filterVM.isVegetarian = isOn;
              }),
              getListTile("严格素食者", "展示严格素食相关食物", filterVM.isVegan, (isOn){
                filterVM.isVegan = isOn;
              })
            ],
          );   
        },
      ),
    );
  }

  Widget getListTile(String title,String subTitle,bool isOn, Function handler) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(value: isOn, onChanged: handler),
    );
  }
  
}



