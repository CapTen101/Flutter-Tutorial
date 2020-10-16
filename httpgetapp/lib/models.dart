class DataObject {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  DataObject({this.userId, this.id, this.title, this.completed});

  factory DataObject.fromJson(Map<String, dynamic> json) {
    return DataObject(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
