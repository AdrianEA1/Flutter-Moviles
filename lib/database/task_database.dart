import 'dart:io';

import 'package:app/models/todo_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskDatabase {

  static final NAMEDB = 'TODODB';
  static final VERSION = 1;

  // ? es para inidicar que la variable es probablemente nula 
  // _ significa que es privada la variable
  static Database? _database;

  Future<Database?> get database async {
    // ! apunta a un direccionamiento que no sea nulo, es decir, 
    // que existe la variable y está inicializada
    if( _database != null) return _database!;
    return _database = await initDatabase();
  }
  
  Future<Database?> initDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, NAMEDB);
    return  openDatabase(
      path,
      version: VERSION, 
      onCreate: (db, version) {
        String query = 
          '''CREATE TABLE todo( 
            idTodo integer primary key,
            titleTodo varchar(33),
            dsctodo varchar(100),
            dateTodo char(10),
            statusTodo boolean
          )''';
        db.execute(query);
      },
      );
  }

  Future<int> INSERTAR(String table, Map<String, dynamic> map) async{
    final conn = await database;
    return conn!.insert(table, map);
  }

  Future<int> UPDATE(table, Map<String, dynamic> map) async{
    final conn = await database;
    return conn!.update(table, map, where: 'idTodo = ?', whereArgs: [map['idTodo']]);
  }
  Future<int> DELETE(table, int idTodo) async{
    final conn = await database;
    return conn!.delete(table, where: 'idTodo = ?', whereArgs: [idTodo]);
  }

  Future<List<TodoModel>> SELECT() async {
    final conn = await database;
    var result = await conn!.query('todo');
    return result.map((task) => TodoModel.fromMap(task)).toList();
  }


}

