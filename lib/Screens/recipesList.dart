import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_response.dart';
import 'package:recipe_app/models/tags.dart';
import 'package:recipe_app/services/apiservices.dart';

class RecipeListScreen extends StatelessWidget {
  final Tag tag;

  const RecipeListScreen({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes for ${tag.name}'),
      ),
      body: FutureBuilder<RecipeResponse>(
        future: ApiService().getRecipesByTag(tag.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final recipeResponse = snapshot.data!;
            final recipes = recipeResponse.recipes;

            // // Print the complete response data
            // print('Total Recipes: ${recipeResponse.total}');
            // print(
            //     'Recipes NAMES: ${recipes.map((recipe) => recipe.name).toList()}');
            // print(
            //     'Recipes tags: ${recipes.map((recipe) => recipe.tags).toList()}');

            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  child: ListTile(
                    title: Text(recipe.name),
                    subtitle: Text(recipe.tags.join(', ')),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No recipes found.'));
          }
        },
      ),
    );
  }
}
