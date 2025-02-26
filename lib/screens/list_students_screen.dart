import 'package:app/views/item_student_view.dart';
import 'package:flutter/material.dart';

class ListStudentsScreen extends StatelessWidget {
  const ListStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Text('Alumnos'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text("Alumnos Grupo Base", style: TextStyle(fontSize: 18),),
              subtitle: Text("Enero - Junio"),
              trailing: Column(
                children: [
                  Text("2024", style: TextStyle(fontSize: 18))
                ],
              )
            ),
            ListView(
              shrinkWrap: true,
              padding:const EdgeInsets.all(20),
              children: [
                ItemStudentView(),
                SizedBox(height: 10,),
                ItemStudentView()
              ],
            )
          ],
        )
      );
  }
}