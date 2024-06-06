import 'recipe.dart';

class RecipeResponse {
  final List<Recipe> recipes;
  final int total;
  final int skip;
  final int limit;

  RecipeResponse({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      recipes:
          List<Recipe>.from(json['recipes'].map((x) => Recipe.fromJson(x))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
