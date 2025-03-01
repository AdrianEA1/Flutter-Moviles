import 'package:app/database/task_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}




class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;

  TextEditingController contrTitle = TextEditingController(); 
  TextEditingController contrDesc = TextEditingController(); 
  TextEditingController contrDate = TextEditingController(); 
  TextEditingController contrStts = TextEditingController(); 

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
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Color.fromARGB(225, 107, 107, 216),
        onPressed: () => _dialogBuilder(context),
        child: Icon(
          Icons.add_task_rounded,
          size: 25,
          color: Colors.green.shade300,
          
        ),
      ),
      body: FutureBuilder(
        future: database!.SELECT(), 
        builder: (context, snapshot) {
          if(snapshot.hasError ){
            return Center(child: Text("Algo ocurrio durante la ejecución"),);
            // return Text(snapshot.error.toString());
          }
          else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var obj = snapshot.data![index];
                return Container(
                  height: 150,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(obj.titleTodo!),
                        subtitle: Text(obj.dateTodo!),
                        trailing: Builder(
                          builder: (context) {
                            if(obj.statusTodo!){
                              return Icon(Icons.check);
                            }
                            else{
                              return Icon(Icons.close);
                            }
                          },
                        ),
                      )
                    ]
                  )
                );
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

  Future<void> _dialogBuilder(BuildContext context){
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        // backgroundColor: Color.fromARGB(190, 145, 163, 173),
        title: Text("Add task"),
        content: Container(
          height: 300,
          width: 230,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: contrTitle,
                decoration: InputDecoration(
                  hintText: 'Titulo de la tarea'
                ),

              ),
              TextFormField(
                controller: contrDesc,
                decoration: InputDecoration(
                  hintText: 'Descripción de la tarea'
                ),
                maxLines: 3,
              ),
              TextFormField(
                readOnly: true,
                controller: contrDate,
                decoration: InputDecoration(
                  hintText: 'Fecha de la tarea'
                ),
                onTap: () async {
                  DateTime? dateTodo = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010), 
                    lastDate: DateTime(2050));
                  
                  if(dateTodo != null){
                    String formattedDate =  DateFormat('yyyy-MM-dd').format(dateTodo);
                    setState(() {
                      contrDate.text = formattedDate;
                    });
                  }
                },
              ),
              TextFormField(
                controller: contrStts,
                decoration: InputDecoration(
                  hintText: 'Estatus de la tarea'
                ),
              ),
          
            ]
          ),
        ),
      );
    },
  );
}
}


