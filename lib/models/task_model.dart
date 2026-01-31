class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool isFavorite;
  String category;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.date,
    this.isFavorite = false,
    required this.category,
    required this.userId,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
    : this(
        title: json['title'],
        description: json['description'],
        date: json['date'],
        category: json['category'],
        id: json['id'],
    userId: json['userId'],
        isFavorite: json['isFavorite'],
      );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "category": category,
      "id": id,
      "userId": userId,
      "isFavorite": isFavorite,
    };
  }
}
