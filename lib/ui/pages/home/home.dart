import 'package:favoritecake/ui/pages/main/main_drawer.dart';
import 'package:flutter/material.dart';

import 'package:favoritecake/core/model/category_model.dart';
import 'package:favoritecake/core/sevices/json_parse.dart';
import 'package:favoritecake/core/extension/int_extension.dart';
import 'package:favoritecake/core/extension/double_extension.dart';
import 'package:favoritecake/ui/pages/home/HomeCategoryItem.dart';
import 'package:favoritecake/core/sevices/category_request.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
        leading: IconButton(
          icon: Icon(Icons.view_list),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: HomeContent()

    );
  }
}


class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: Future.delayed(Duration(seconds: 1),CategoryRequest.requestCategories),
      builder: (cxt, snapShot) {
        if (snapShot.hasData ) {
          final categories = snapShot.data;
          return GridView.builder(
              padding: EdgeInsets.all(20.px),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.px,
                  crossAxisSpacing: 20.px,
                  childAspectRatio: 1.5
              ),
              itemBuilder: (ctx, index) {
                return HomeCategoryItem(categories[index]);
              }
          );
        } else if (snapShot.hasError){
          return Center (child: Text("加载失败"));
        } else {
          return Center (child: CircularProgressIndicator());
        }
      }
    );
  }
}


//class HomeContent extends StatefulWidget {
//  @override
//  _HomeContentState createState() => _HomeContentState();
//}

//class _HomeContentState extends State<HomeContent> {
//
//
//  List<CategoryModel> _models = [];
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//   JsonParse.getCategoryData().then((res) {
//     setState(() {
//       _models = res;
//     });
//   });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      padding: EdgeInsets.all(20),
//      itemCount: _models.length,
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2,
//          mainAxisSpacing: 20.px,
//          crossAxisSpacing: 20.px,
//          childAspectRatio: 1.5
//        ),
//        itemBuilder: (ctx, index) {
//          return HomeCategoryItem(_models[index]);
//        }
//    );
//  }
//}
//


