import 'package:favoritecake/core/model/category_model.dart';
import 'package:favoritecake/core/sevices/http_request.dart';
import 'package:favoritecake/core/sevices/json_parse.dart';


class CategoryRequest {
  static  Future<List<CategoryModel>> requestCategories() async {
    try {
     final result = await HttpRequest.request("/category");
     final category = result["category"];
     List<CategoryModel> models = [];
     for (var item in category) {
       models.add(CategoryModel.fromJson(item));
     }
     return models;
    } catch(_) {
      return JsonParse.getCategoryData();
    }
  }
}