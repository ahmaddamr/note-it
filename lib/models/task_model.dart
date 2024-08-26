
class TaskModel {
  String id;
  String userId;
  String title;
  String desc;
  int time;
  String hour;
  bool isDone;
  TaskModel({
    this.id = '',
    this.userId = '',
    required this.hour,
    required this.title,
    required this.desc,
    required this.time,
    required this.isDone,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        desc: json['desc'],
        time: json['time'],
        hour: json['hour'],
        isDone: json['isDone']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'desc': desc,
      'time': time,
      'hour': hour,
      'isDone': isDone
    };
  }
}
