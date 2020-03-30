import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/Models/todo.dart';

class Db_helper{
  static Db_helper _db_helper;
  static Database _database;

  String todoTable = 'todo_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';

  Db_helper._createInstance();

  factory Db_helper(){
    if(_db_helper == null){
      _db_helper = Db_helper._createInstance();
    }
    return _db_helper;
  }

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todos.db';

    var todosDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
    '$colDescription TEXT, $colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getTodoMapList() async{
    Database db = await this.database;

    var result = await db.query(todoTable, orderBy: '$colTitle ASC');
    return result;
  }

  // Insert todo
  Future<int> insertTodo(Todo todo) async{
    Database db = await this.database;
    var result = await db.insert(todoTable, todo.toMap());
    return result;
  }

  // update todo
  Future<int> updateTodo(Todo todo) async{
    var db = await this.database;
    var result = await db.update(todoTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
    return result;
  }

  // delete todo
  Future<int> deleteTodo(int id) async{
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $todoTable WHERE $colId = $id');
    return result;
  }

  // get number of todo list
  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $todoTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // get maplist convert to todo list
  Future<List<Todo>> getTodoList() async{
    var todoMapList = await getTodoMapList();
    int count = todoMapList.length;

    List<Todo> todoList = List<Todo>();
    // loop for create todo list from map list/
    for(int i = 0; i < count; i++){
      todoList.add(Todo.fromMapObject(todoMapList[i]));
    }

    return todoList;
  }


}