import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/tags.dart';
import '../models/recipe_response.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com';

  Future<List<Tag>> getAllTags() async {
    final response = await http.get(Uri.parse('$baseUrl/recipes/tags'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return Tag.fromJsonList(data);
    } else {
      throw Exception('Failed to load tags');
    }
  }

  Future<RecipeResponse> getRecipesByTag(String tagName) async {
    final response = await http.get(Uri.parse('$baseUrl/recipes/tag/$tagName'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return RecipeResponse.fromJson(data);
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
