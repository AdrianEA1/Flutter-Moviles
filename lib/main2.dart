import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          contador++;
              print(contador);
              setState(() {    
              });
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 142, 214, 135),
            title: Center(
              child: Text('Hola mundo ',
              textAlign: TextAlign.center, 
              style: TextStyle(
                color: const Color.fromARGB(255, 39, 60, 129),
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontFamily: 'Natu'  
              ),),
            ) 
          ),
          floatingActionButton: FloatingActionButton(
            // child: Icon(
            //   Icons.arrow_drop_down_outlined
            // ),
            child: Image.network('https://imgs.search.brave.com/ZmElXgQCA0G4yc0KbIulRoE4vrri29ELRqlxfRVT0nE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9paDEu/cmVkYnViYmxlLm5l/dC9pbWFnZS41MDYy/MDY1MzYwLjU1NDIv/cmFmLDM2MHgzNjAs/MDc1LHQsZmFmYWZh/OmNhNDQzZjQ3ODYu/anBn'),
            onPressed: (){
              
            }
          ),
          body: Center(
            child: Text('Valor del contador \n\t$contador',
              style: 
                TextStyle(
                  fontFamily: 'Natu',
                  fontSize: 24, 
                )  
              ,)
            ),
        ),
      )
    );
  }
}