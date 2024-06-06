class Recipe {
  final int id;
  final String name;
  final List<String> tags;

  Recipe({
    required this.id,
    required this.name,
    required this.tags,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      tags: List<String>.from(json['tags']),
    );
  }
}
