import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpenditure/helpers/database_helper.dart';
import 'package:xpenditure/models/task_model.dart';
import 'package:xpenditure/screens/add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // list of tasks
  Future<List<Task>> _taskList;
  final DateFormat _dateFormat = new DateFormat('MMM dd, yyy');

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  Widget _buildTask(Task task) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(children: <Widget>[
          ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                  fontSize: 18.0,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            subtitle: Text(
              '${_dateFormat.format(task.date)} - ${task.priority}',
              style: TextStyle(
                  fontSize: 15.0,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            trailing: Checkbox(
              // mark a task as complete
              onChanged: (value) {
                task.status = value ? 1 : 0;
                DatabaseHelper.instance.updateTask(task);
                _updateTaskList();
              },
              activeColor: Theme.of(context).primaryColor,
              value: task.status == 1 ? true : false,
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddTaskScreen(
                      updateTaskList: _updateTaskList, task: task),
                )),
          ),
          Divider(),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        AddTaskScreen(updateTaskList: _updateTaskList)))),
        body: FutureBuilder(
            future: _taskList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // completed tasks
              final int completedTaskCount = snapshot.data
                  .where((Task task) => task.status == 1)
                  .toList()
                  .length;

              return ListView.builder(
                  //number of tasks
                  itemCount: 1 + snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'My 2DOS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0),
                              ),
                              Text(
                                '$completedTaskCount of ${snapshot.data.length} todos',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ));
                    }

                    // render tasks, pass in tasks tasks
                    return _buildTask(snapshot.data[index - 1]);
                  });
            }));
  }
}
