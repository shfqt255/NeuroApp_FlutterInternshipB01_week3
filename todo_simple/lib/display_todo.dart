import 'package:flutter/material.dart';
import 'package:todo_simple/todo_simple.dart';

// 7. Create DisplayTodo as StatefulWidget
class DisplayTodo extends StatefulWidget {
  final List<String> taskNameList;
  final List<String> taskDescriptionList;
  const DisplayTodo({
    required this.taskNameList,
    required this.taskDescriptionList,
    super.key,
  });

  @override
  State<DisplayTodo> createState() => _DisplayTodoState();
}

class _DisplayTodoState extends State<DisplayTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Tasks'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: widget.taskNameList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.taskNameList[index]),
           subtitle: Text(widget.taskDescriptionList[index]),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoPage()),
                );
              },
              child: Text('Add Task'),
            ),
          );
        },
      ),
    );
  }
}
