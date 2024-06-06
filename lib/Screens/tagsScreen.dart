// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:recipe_app/Screens/recipesList.dart';
import 'package:recipe_app/models/tags.dart';
import 'package:recipe_app/services/apiservices.dart';

class TagListScreen extends StatefulWidget {
  @override
  _TagListScreenState createState() => _TagListScreenState();
}

class _TagListScreenState extends State<TagListScreen> {
  late Future<List<Tag>> futureTags;

  @override
  void initState() {
    super.initState();
    futureTags = ApiService().getAllTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recipe Tags'),
      ),
      body: FutureBuilder<List<Tag>>(
        future: futureTags,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tags = snapshot.data!;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
              itemCount: tags.length,
              itemBuilder: (context, index) {
                final tag = tags[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeListScreen(tag: tag),
                      ),
                    );
                  },
                  child: Card(
                    child: Center(
                      child: Text(tag.name),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
