class Task {
  int id;
  String title;
  DateTime date;
  String priority;
  int status; // 1 - complete 0 - not complete

  
  Task({this.id, this.title, this.date, this.priority, this.status});
  Task.withId({this.id, this.title, this.date, this.priority, this.status});

  // convert data into map for storing to sqflite
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id == null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  // convert map into task, takes map as an arguement
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }
}
