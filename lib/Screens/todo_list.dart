import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todolist/Models/todo.dart';
import 'package:todolist/Utils/db_helper.dart';
import 'package:todolist/Screens/todo_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/Widget/navdrawer.dart';

class TodoList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return TodoListState();
  }
}

class TodoListState extends State<TodoList>{
  Db_helper db_helper = Db_helper();
  List<Todo> todoList;
  int count = 0;

  @override
  Widget build(BuildContext context){
    if(todoList == null){
      todoList = List<Todo>();
      updateListView();
    }

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: getTodoListView(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint('FAB clicked');
            navigateToDetail(Todo('','',''), 'Add Todo');
          },
          tooltip: 'Add Todo',
          child: Icon(Icons.add),
        ),
    );
  }

  ListView getTodoListView(){
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(getFirstLetter(this.todoList[position].title),
                style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              title: Text(this.todoList[position].title,
              style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(this.todoList[position].description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.delete, color: Colors.black),
                    onTap: (){
                      _delete(context, todoList[position]);
                    },
                  )
                ],
              ),
              onTap: (){
                debugPrint("ListTile Tapped");
                navigateToDetail(this.todoList[position], 'Edit Todo');
              },
            ),
          );
        },
      );
  }
  
  getFirstLetter(String title){
    return title.substring(0, 2);
  }

  void _delete(BuildContext context, Todo todo) async{
    int result = await db_helper.deleteTodo(todo.id);
    if(result != 0 ){
      _showSnackBar(context, 'Todo Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message){
    final snackbar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void navigateToDetail(Todo todo, String title) async{
    bool result =
      await Navigator.push(context, MaterialPageRoute(builder: (context){
        return TodoDetail(todo, title);
      }));

      if(result == true){
        updateListView();
      }
  }
  
  void updateListView(){
    final Future<Database> dbFuture = db_helper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Todo>> todoListFuture = db_helper.getTodoList();
      todoListFuture.then((todoList) {
        setState((){
          this.todoList = todoList;
          this.count = todoList.length;
        });
      });
    });
  }

}