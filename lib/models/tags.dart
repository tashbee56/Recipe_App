class Tag {
  final String name;

  Tag({required this.name});

  factory Tag.fromJson(String json) {
    return Tag(name: json);
  }

  static List<Tag> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Tag.fromJson(json as String)).toList();
  }
}
