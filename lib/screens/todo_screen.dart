import 'package:app/database/task_database.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;

  // Vas a poder inicializar cualquier variable antes de hacer un render
  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO List')),
      body: FutureBuilder(
        future: database!.SELECT(), 
        builder: (context, snapshot) {
          if(snapshot.hasError ){
            return Center(child: Text("Algo ocurrio durante la ejecución"),);
          }
          else if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (context, index) {
                
              },
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
        ),
    );
  }
}