enum TaskCategory { work, meeting, family, me }

class Todo {
  int? id;
  String title;
  String description;
  TaskCategory category;
  DateTime date;
  String startTime;
  String endTime;
  /*  TimeOfDay startTime;
  TimeOfDay endTime; */

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.startTime,
    required this.endTime,
    /* required this.startTime,
    required this.endTime, */
  });

  // Convert a Todo into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category.index, // Store enum as integer
      'date': date.toIso8601String(),
      'starttime': startTime,
      'endtime': endTime,
    };
  }

  // Convert a Map into a Todo.
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: TaskCategory.values[map['category']],
      date: DateTime.parse(map['date']),
      startTime: map['starttime'],
      endTime: map['endtime'],
      /*  startTime: TimeOfDay(
        hour: int.parse(map['startTime'].toString().split(":")[0]),
        minute: int.parse(map['startTime'].toString().split(":")[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(map['endTime'].toString().split(":")[0]),
        minute: int.parse(map['endTime'].toString().split(":")[1]),
      ), */
    );
  }
}
