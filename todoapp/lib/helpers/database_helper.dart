import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xpenditure/models/task_model.dart';

class DatabaseHelper {
  // db will have a single instance throughout the application
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  // create tasks table
  String taskTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';

  // Task Table
  // id | title | date  | priority  | status
  //  0     ''      ''      ''          0
  //  1     ''      ''      ''          0
  //  2     ''      ''      ''          0

  // getter function for the db
  Future<Database> get db async {
    // if no db exists init or create it
    if (_db == null) {
      _db = await _initDb();
    }
    // else return the db
    return _db;
  }

  // create db
  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    final todoListDb =
        await openDatabase(path, version: 1, onCreate: _createTable);
    return todoListDb;
  }

  // create table

  void _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $taskTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT, $colPriority TEXT,  $colStatus INTEGER)');
  }

  // get list map of tasks from db

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(taskTable);
    return result;
  }

  // convert listmap of tasks into list

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
    final List<Task> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(Task.fromMap(taskMap));
      taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    });
    return taskList;
  }

  // insert
  Future<int> insertTask(Task task) async {
    Database db = await this.db;
    final int result = await db.insert(taskTable, task.toMap());
    return result;
  }

  // update task

  Future<int> updateTask(Task task) async {
    Database db = await this.db;
    final int result = await db.update(taskTable, task.toMap(),
        where: "$colId = ?", whereArgs: [task.id]);
    return result;
  }

  // delete task

  Future<int> deleteTask(Task task) async {
    Database db = await this.db;
    final int result =
        await db.delete(taskTable, where: '$colId = ? ', whereArgs: [task.id]);
    return result;
  }
}
