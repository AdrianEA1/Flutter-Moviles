import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';

class LeadingProduct extends StatefulWidget {
  const LeadingProduct({super.key});

  @override
  State<LeadingProduct> createState() => _LeadingProductState();
}

class _LeadingProductState extends State<LeadingProduct> {

  BoxController boxController = BoxController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        controller: boxController,
        collapsed: true,
        minHeight: MediaQuery.of(context).size.height * 0.1,
        maxHeight: MediaQuery.of(context).size.height * 0.45,
        draggable: false,
        color: Color(0xFF222834),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(1, 3), // Cambia la posición de la sombra
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textColor: Color.fromARGB(255, 97, 104, 110),
                    // color: Color.fromARGB(200, 80, 79, 79),
                    // elevation: 8,
                    // focusElevation: 15
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    // shape: Border.all(color: Color.fromARGB(255, 57, 61, 70), width: 2, strokeAlign: BorderSide.strokeAlignCenter),
                    onPressed: () {
                      if(boxController.isBoxClosed){
                        boxController.openBox();
                      }
                    },
                    child: const Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(1, 3), // Cambia la posición de la sombra
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textColor: Color.fromARGB(255, 97, 104, 110),
                    // color: Color.fromARGB(200, 80, 79, 79),
                    // elevation: 8,
                    // focusElevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    // shape: Border.all(color: Color.fromARGB(255, 57, 61, 70), width: 2, strokeAlign: BorderSide.strokeAlignCenter),
                    onPressed: () {
                      if(boxController.isBoxClosed){
                        boxController.openBox();
                      }
                    },

                    focusColor: Color.fromARGB(202, 107, 192, 10),
                    child: const Text("Specification", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                  ),
                ),
                
              ],
              
            ),
              ListTile(
                  minTileHeight: 190,
                  contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  // textColor: Colors.white,
                  titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.white
                  ),
                  subtitleTextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1,
                    color: Color.fromARGB(197, 200, 206, 200)
                  ),
                  title: Text("PEUGEOT - LR01"),
                  subtitle: Text("Turbo Wheels ha diseñado el radio control más moderno, ¡Terreneitor!, el coche más poderoso que ha existido, con tracción 4x4 y dos turbo motores, ese sí es todo terreno, las calles son fáciles, mételo al lodo, parte la nieve, pasa por el agua, ¡Terreneitor!, es el más potente que haya existido ¿o qué prefieres un coche para niñitas? ¡Terreneitor! De Fotorama."),
              ),
              Container(
                // width: 150,
                height: 76,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(colors: [Color(0xFF262E3D),Color(0xFF212936)]),
                  border: Border.all(color: Color(0xFF2E384A),width: 2, strokeAlign: BorderSide.strokeAlignCenter),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1F2530),
                      spreadRadius: 10,
                      blurRadius: 6,
                      // blurStyle: BlurStyle.solid,
                      offset: Offset(0, -3), // Cambia la posición de la sombra
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 25,
                  children: [
                    Text(
                      "\$1,999.99",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3D9CEA)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 25,
                        right: 25
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFF37B7E9),Color(0xFF466EEF)]),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF37B7E9),width: 2, strokeAlign: BorderSide.strokeAlignCenter)
                      ),
                      child: MaterialButton(
                        textColor: Colors.white,
                        
                        onPressed: () {
                          Navigator.pushNamed(context, "/shop_bike");
                        },
                        child: Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        backdrop: Backdrop(
          width: MediaQuery.of(context).size.width,
          overlay: true,
          appBar: BackdropAppBar(
            title: Padding(
              padding: EdgeInsets.all(20),
              child: Text("PEUGEOT - LR01", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),),
            ),
            leading: Icon(Icons.keyboard_arrow_down_outlined, size: 40, color: Colors.white,)
          ),
          color: Color(0xFF242C3B),
          body: Container(

            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Rectangle.png"), fit: BoxFit.cover),
              // color: Colors.amberAccent
            ),
            child: Center(
              child: Image(image: AssetImage("assets/bici_model2.png")),
            ),
          )
        ),
      ),
    );
  }
}