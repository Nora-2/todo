class TodoModel {
  int? id;
  String title;
  String description;
  String time;
  int favorite;
  int completed; // Add this field

  TodoModel({this.id, required this.title, required this.description, required this.time, required this.favorite, required this.completed});

  // Assuming fromJson method looks something like this:
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
      favorite: json['favorite'],
      completed: json['completed'], // Deserialize completed status
    );
  }
}
