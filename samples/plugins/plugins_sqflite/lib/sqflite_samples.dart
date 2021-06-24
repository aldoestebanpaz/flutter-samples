import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:plugins_sqflite/model/todo.dart';
import 'package:plugins_sqflite/repository/todo_repository.dart';
import 'package:plugins_sqflite/utils/files.dart';

class SqfliteSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SqfliteSamplesState();
}

class _SqfliteSamplesState extends State<SqfliteSamples> {
  late List<Todo> todos;
  late int todosCount;
  late String info;

  @override
  void initState() {
    super.initState();
    todos = [];
    todosCount = 0;
    info = 'getting data...';

    Future.delayed(Duration(seconds: 4), () async {
      String dbFilePath = await Files.getDbFilePath();
      debugPrint('Database file location: ' + dbFilePath);

      if (!(await File(dbFilePath).exists())) {

        setState(() {
          info = 'creating database and sample data ...';
        });

        var todayDate = new DateFormat('yyyy/MM/dd').format(DateTime.now());

        TodoRepository.insert(Todo('Complete my flutter app', 2, todayDate, 'A wish but not a must'));
        var updateMeId = await TodoRepository.insert(Todo('#\$#\$#', 1, todayDate, ':):('));
        TodoRepository.insert(Todo('Sleep', 3, todayDate, 'Not required at all'));
        var deleteMeId = await TodoRepository.insert(Todo('delete me', 3, todayDate, 'delete me'));
        TodoRepository.update(Todo.withId(updateMeId, 'Make coffee', 1, todayDate, 'Required'));
        TodoRepository.delete(deleteMeId);
      }

      var todosInDb = await TodoRepository.count();
      setState(() {
        info = 'todos in db: $todosInDb';
      });
      todos = await TodoRepository.getAll();
      setState(() {
        this.todos = todos;
        todosCount = todos.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text('Sample: plugins - sqflite'),
          subtitle: Text(info)
        ),
      ),
      body: generateBody(),
    );
  }

  Widget generateBody() {
    return todosCount > 0 ? ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: todosCount,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 3,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(todos[index].priority.toString())
              ),
              title: Text(todos[index].title),
              subtitle: Text(todos[index].date),
              onTap: () => debugPrint('Tapped on ID ${todos[index].id} and priority ${todos[index].priority}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('SHOW DETAILS'),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(todos[index].title + ' (id: ${todos[index].id})'),
                      content: Text(todos[index].description ?? '<There is no details>')
                    )
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        )
      )
    )
    : const Center(child: Text('No items'));
  }
}
