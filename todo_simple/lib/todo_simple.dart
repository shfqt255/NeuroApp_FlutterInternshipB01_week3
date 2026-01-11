import 'package:flutter/material.dart';
import 'display_todo.dart';

// 7. Create TodoPage as StatefulWidget
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _formkey = GlobalKey<FormState>();
  // 8. List to store todos
  List<String> taskNameList = [];
  List<String> taskdescriptionList = [];

  // 9. TextEditingController for input
  final TextEditingController _taskNamecontroller = TextEditingController();
  final TextEditingController _taskDesController = TextEditingController();
  // 10. Add new todo
  void addTodo() {
    String TaskName = _taskNamecontroller.text.trim();
    String TaskDes = _taskDesController.text.trim();
    if (TaskName.isNotEmpty || TaskDes.isNotEmpty) {
      setState(() {
        taskNameList.add(TaskName);
        taskdescriptionList.add(TaskDes);
        _taskNamecontroller.clear();
        _taskDesController.clear(); // clear input after adding the task
      });
    }
  }

  // Delete todo at index
  void deleteTodo(int index) {
    setState(() {
      taskNameList.removeAt(index);
      taskdescriptionList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Form(
          key: _formkey,
          child: Column(
            children: [
              buildTextField(_taskNamecontroller, 'Task Name', (value) {
                if (value == null || value.isEmpty) {
                  return 'Required field*';
                }
                return null;
              }),
              const SizedBox(height: 10),
              buildTextField(_taskDesController, 'Task Description', (value) {
                return null;
              }),
              // Input field and add button
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addTodo();
                },
                child: Text('Add Task'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayTodo(
                            taskNameList: taskNameList,
                            taskDescriptionList: taskdescriptionList,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('View Tasks'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      deleteTodo(1); // latest task deleted
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Delete LatestTask'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
  final TextEditingController controller,
  String label,
  final String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    validator: validator,
    maxLines: 1,
    decoration: InputDecoration(
      label: Text(label),
      floatingLabelStyle: TextStyle(color: Colors.teal.shade800),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal.shade800),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal.shade800),
      ),
    ),
    cursorColor: Colors.teal.shade800,
    cursorErrorColor: Colors.teal.shade800,
  );
}
