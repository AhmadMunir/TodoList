// import 'dart:ffi';

// import 'package:flutter/material.dart';

// void main() => runApp(new TodoApp());

// class TodoApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Todo List',
//       home: new TodoList()
//     );
//   }
// }

// class TodoList extends StatefulWidget{
//   @override
//   createState() => new TodoListState();
// }

// class TodoListState extends State<TodoList>{
//   List<String> _todoItems = [];

//   void _addTodoItem(String task){
//    if(task.length > 0){
//      setState(() => _todoItems.add(task));
//    }
//   }

//   void _removeTodoItem(int index){
//     setState(() => _todoItems.removeAt(index));
//   }

//   void _promptRemoveTodoItem(int index){
//     showDialog(
//         context: context,
//         builder: (BuildContext context){
//           return new AlertDialog(
//             title: new Text('Mark "${_todoItems[index]}" as done?'),
//             actions: <Widget>[
//               new FlatButton(
//                 onPressed: () => Navigator.of(context).pop(), 
//                 child: new Text('CANCEL')),
//               new FlatButton(
//                 onPressed: (){
//                   _removeTodoItem(index);
//                   Navigator.of(context).pop();
//                 }, 
//                 child: new Text('MARK AS DONE'))
//             ],
//           );
//         }
//       );
//   }

//   Widget _buildTodoList(){
//     return new ListView.builder(
//         itemBuilder: (context, index){
//           if(index < _todoItems.length){
//             return _buildTodoItem(_todoItems[index], index);
//           }
//         },
//       );
//   }

//   Widget _buildTodoItem(String todoText, int index){
//     return new ListTile(
//       title: new Text(todoText),
//       onTap: () => _promptRemoveTodoItem(index),
//     );
//   }

//   @override
//   Widget build(BuildContext context){
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Todo List'),
//       ),
//       body: _buildTodoList(),
//       floatingActionButton: new FloatingActionButton(
//           onPressed: _pushAddTodoScreen,
//           tooltip: 'Add task',
//           child: new Icon(Icons.add),
//         ),
//     );
//   }

//   void _pushAddTodoScreen(){
//     Navigator.of(context).push(
//       new MaterialPageRoute(
//         builder: (context) {
//           return new Scaffold(
//             appBar: new AppBar(
//               title : new Text('Add a new Task')
//             ),
//             body: new TextField(
//               autofocus : true,
//               onSubmitted : (val){
//                 _addTodoItem(val);
//                 Navigator.pop(context);
//               },
//               decoration: new InputDecoration(
//                 hintText: 'Enter something to do .....',
//                 contentPadding: const EdgeInsets.all(16.0)
//               ),
//             ),
//           );
//         })
//     );
//   }


// }

import 'package:flutter/material.dart';
import 'package:todolist/Screens/todo_list.dart';

import 'Screens/login_page.dart';

void main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Todo List APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: TodoList(),
      home: LoginPage(),
    );
  }
}