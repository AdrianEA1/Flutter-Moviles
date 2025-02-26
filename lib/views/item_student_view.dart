import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF006BD8)),
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/550"),
              ),
              title: Text("Adrián Estrada Álvarez"),
              subtitle: Text("No.Control: 21030975"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: Color(0xFFEDf3FF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    // defaultVerticalAlignment: TableCellVerticalAlignment.fill,
                    children: [
                      TableRow(
                        
                        children: [
                          Center(child: Text("Semetre")),
                          Center(child: Text("Clave")),
                          Center(child: Text("Grupo Materia"))
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(child: Text("8")), 
                          Center(child: Text("GM18")), 
                          Center(child: Text("B"))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("INGENIERÍA EN SISTEMAS COMPUTACIONALES",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
