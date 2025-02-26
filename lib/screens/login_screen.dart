import 'package:app/utils/global_value.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isValidating = false;

  @override
  Widget build(BuildContext context) {

    final txtUser = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el usuario"
      ),
    );

    final txtPass = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce la contraseña"
      ),
    );



    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: .8,
            fit: BoxFit.cover,
            image: AssetImage("fondo.jpg") 
          )
        ),
        child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 200,
                // child: isValidating ? CircularProgressIndicator() : Container(),
                child: ValueListenableBuilder(
                  valueListenable: GlobalValue.isValidating, 
                  builder: (context, value, _) {
                    return value ? CircularProgressIndicator() : Container();
                  },
                ),
              ),
              Positioned(
                top: 230,
                child: Lottie.asset("tecnmjson.json", height: 150)
              ),
              Positioned(
                bottom: 50,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 250,
                  width: MediaQuery.of(context).size.width * .9 ,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 246, 247),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      txtUser,
                      SizedBox(height: 10),
                      txtPass,
                      GestureDetector(
                        onTap: () => {
                          // isValidating = true,
                          GlobalValue.isValidating.value = true,
                          Future.delayed(Duration(milliseconds: 2000)).then((value) {
                            // isValidating = false;
                            GlobalValue.isValidating.value = false;
                            Navigator.pushNamed(context, "/dash");
                          },),
                          // Navigator.pushNamed(context, "/list"),
                        },

                        // Navigator.push(
                        //   context, 
                        //   MaterialPageRoute(builder: (context) => ListStudentsScreen(),)
                        // ),
                        child: Image.asset("start.png", height: 70, scale: 0.5,)
                      ),
                    ],
                  ),
                )
              )
            ],
        ),
      ),
    );
  }
}