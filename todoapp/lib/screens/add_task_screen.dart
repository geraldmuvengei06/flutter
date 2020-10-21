import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:xpenditure/helpers/database_helper.dart';
import 'package:xpenditure/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  // AddTaskScreen({Key key}) : super(key: key);
  final Function updateTaskList;
  final Task task;

  AddTaskScreen({this.updateTaskList, this.task});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  String _title;

  String _priority;

  bool submit = false;

  DateTime _date = DateTime.now();

  final DateFormat _dateFormat = new DateFormat('MMM dd, yyy');

  TextEditingController _dateController = new TextEditingController();

  final List<String> _priorityLevels = ['Low', 'Medium', 'High'];

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _title = widget.task.title;
      _date = widget.task.date;
      _priority = widget.task.priority;
    }

    _dateController.text = _dateFormat.format(_date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDatePicker() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });

      _dateController.text = _dateFormat.format(date);
    }
  }

  _delete() {
    DatabaseHelper.instance.deleteTask(widget.task);
  }

  _dosubmit() {
    submit = true;
    print(submit);
    _submit();
  }

  _submit() {
    if (_formKey.currentState != null &&
        _formKey.currentState.validate() &&
        submit) {
      _formKey.currentState.save();
      print('$_title, $_date, $_priority');

      Task task = Task(title: _title, date: _date, priority: _priority);

      if (widget.task == null) {
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
      } else {
        task.id = widget.task.id;
        task.status = widget.task.status;
        DatabaseHelper.instance.updateTask(task);
      }

      // widget.updateTaskList();
      // Navigator.pop(context);
      // Navigator.push(
      // context, MaterialPageRoute(builder: (_) => TodoListScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,
                size: 30.0, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 20.0),
          Text(
            widget.task == null ? 'Add Todo' : 'Update Todo',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40.0),
          ),
          SizedBox(height: 10.0),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    validator: (value) => value.trim().isEmpty
                        ? "Please enter a todo title"
                        : null,
                    onSaved: (value) => {
                      setState(() => {_title = value})
                    },
                    initialValue: _title,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      onTap: _handleDatePicker,
                      controller: _dateController,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.arrow_drop_down_circle),
                      iconEnabledColor: Theme.of(context).primaryColor,
                      iconSize: 22.0,
                      items: _priorityLevels.map((String level) {
                        return DropdownMenuItem(
                            value: level,
                            child: Text(level,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0)));
                      }).toList(),
                      onChanged: (value) => {
                        setState(() => {_priority = value})
                      },
                      value: _priority,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelText: 'Priority',
                          labelStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (value) => value == null
                          ? 'Please select a priority level'
                          : null,
                      onSaved: (value) => _priority = value,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: FlatButton(
                    child: Text(
                      widget.task == null ? "Add" : "Update",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: _dosubmit(),
                  ),
                ),
                widget.task != null
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: FlatButton(
                          child: Text(
                            "Delete",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: _delete(),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
