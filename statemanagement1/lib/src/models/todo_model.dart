class TodoModel {
  TodoModel({
    required this.id,
    required this.title,
    required this.isDone,
  });

  String? id;
  String? title;
  bool? isDone;

  TodoModel copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"],
      title: json["title"],
      isDone: json["isDone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isDone": isDone,
      };

  @override
  String toString() {
    return "$id, $title, $isDone, ";
  }
}
