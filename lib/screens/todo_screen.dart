import 'package:app/database/task_database.dart';
import 'package:app/utils/global_value.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
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
      body: ValueListenableBuilder(
        valueListenable: GlobalValue.updList,
        builder: (context, valie, widget) { 
          return FutureBuilder(
          future: database!.SELECT(), 
          builder: (context, snapshot) {
            if(snapshot.hasError ){
              // return Center(child: Text("Algo ocurrio durante la ejecución"),);
              print(snapshot.error.toString());
              return Text(snapshot.error.toString());
              
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
                        ),
                        Text(obj.dsctodo!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: () {
                              contrTitle.text = obj.titleTodo!;
                              contrDesc.text = obj.dsctodo!;
                              contrDate.text = obj.dateTodo!;
                              contrStts.text =  obj.statusTodo!.toString();
                              _dialogBuilder(context, obj.idTodo!);
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed:(){
                              database!.DELETE('todo', obj.idTodo!).then((value){
                                if(value > 0) {
                                  GlobalValue.updList.value = !GlobalValue.updList.value;
                                }
                              });
                            }, icon: Icon(Icons.delete))
                          ],
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
          );
      } ),
      
    );
  }

  Future<void> _dialogBuilder(BuildContext context, [int idTodo = 0]){
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        // backgroundColor: Color.fromARGB(190, 145, 163, 173),
        title: (idTodo == 0) ? Text("Add task") : Text("Edit Task"),
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
              Divider(),
              ElevatedButton(
                onPressed: (){
                  if(idTodo == 0){
                  database!.INSERTAR('todo', {
                    'titleTodo': contrTitle.text,
                    'dsctodo': contrDesc.text,
                    'dateTodo': contrDate.text,
                    'statusTodo': false,
                  }).then((value){
                    if(value > 0){
                      GlobalValue.updList.value = !GlobalValue.updList.value;
                      ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertType.success,
                          title: 'Mensaje de la app',
                          text: 'Datos insertados correctamente'
                        )
                      );
                    }
                  
                  });
                }else{
                  database!.UPDATE("todo", {
                    'idTodo' : idTodo,
                    'titleTodo': contrTitle.text,
                    'dscTodo': contrDesc.text,
                    'dateTodo': contrDate.text,
                    'statusTodo': false,
                  }).then((value){
                    if(value > 0){
                      GlobalValue.updList.value = !GlobalValue.updList.value;
                      ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertType.success,
                          title: 'Mensaje de la app',
                          text: 'Datos actualizados correctamente'
                        )
                      );
                    }
                  
                  });
                }
                  contrTitle.text = "";
                  contrDesc.text = "";
                  contrDate.text = "";
                  contrStts.text = "";
                  Navigator.pop(context);
                },
                child: Text("Guardar"),
              )
          
            ]
          ),
        ),
      );
    },
  );
}
}


