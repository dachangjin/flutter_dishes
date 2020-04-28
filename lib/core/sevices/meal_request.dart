import 'package:favoritecake/core/model/meal_model.dart';
import 'package:favoritecake/core/sevices/json_parse.dart';
import 'http_request.dart';

class MealRequest {
  static Future<List<MealModel>> requestMeals() async {

    try {
      final result = await HttpRequest.request("/meal");
      List<MealModel> models = [];
      for (var item in result["meal"]) {
        models.add(MealModel.fromJson(item));
      }
      return models;
    } catch (_) {
      return JsonParse.getMealData();
    }
  }
}