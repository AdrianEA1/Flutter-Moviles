import 'package:app/utils/global_value.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  bool isValidating = false;
  bool _holdSession = false;
  String? _user;
  String? _psw;

  String? _userName;
  String? _userPsw;
  // bool? _userSsn;

  Future<void> _loadSaveData2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString("name");
      _userPsw = prefs.getString("psw");
    });
  }

  Future<void> _saveSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("session", true);
  }


  @override
  void initState() {
    super.initState();
    _loadSaveData2();
  }

  TextEditingController contrUser = TextEditingController();
  TextEditingController contrPsw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final txtUser = TextFormField(
    //   controller: contrUser,
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Ingrese un nombre';
    //     }
    //     _user = value;
    //     return null;
    //   },
    //   decoration: InputDecoration(
    //       border: OutlineInputBorder(), hintText: "Introduce el usuario"),
    // );

    // final txtPass = TextFormField(
    //   controller: contrPsw,
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Ingrese la contraseña';
    //     }
    //     _psw = value;
    //     return null;
    //   },
    //   obscureText: true,
    //   decoration: InputDecoration(
    //       border: OutlineInputBorder(), hintText: "Introduce la contraseña"),
    // );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: .8,
                fit: BoxFit.cover,
                image: AssetImage("assets/fondo.jpg"))),
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
                child: Lottie.asset("assets/tecnmjson.json", height: 150)),
            Positioned(
                bottom: 50,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 360,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 246, 247),
                      borderRadius: BorderRadius.circular(10)),
                  child: Form(
                    key: _formLoginKey,
                    child: Column(
                      children: [
                        // txtUser,
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un nombre';
                            }
                            _user = value;
                            return null;
                          },
                          controller: contrUser,
                          decoration: InputDecoration(
                            hintText: "Ingresa tu nombre",
                            prefixIcon: Icon(Icons.person),
                            labelText: "Nombre",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un nombre';
                            }
                            _psw = value;
                            return null;
                          },
                          controller: contrPsw,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Ingresa tu contraseña",
                            prefixIcon: Icon(Icons.password),
                            labelText: "Contraseña",
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {
                                if (!_holdSession) {
                                  _holdSession = true;
                                } else {
                                  _holdSession = false;
                                }
                                // print(_holdSession);
                              },
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            Text("¿Matener la sesión activa?")
                          ],
                        ),
                        GestureDetector(
                            onTap: () => {
                                  // isValidating = true,

                                  if (_formLoginKey.currentState!.validate())
                                    {
                                      Future.delayed(
                                              Duration(milliseconds: 2000))
                                          .then(
                                        (value) {
                                          GlobalValue.isValidating.value = true;
                                          // isValidating = false;
                                          // print("ansdjnjinoaij $_userName");
                                          // print("hlolaaaa $_userPsw");
                                          // print("hlolaaaa $_user");
                                          // print("hlolaaaa $_psw");
                                          GlobalValue.isValidating.value =
                                              false;
                                          if (_userName == _user &&
                                              _userPsw == _psw) {
                                            if(_holdSession){
                                              _saveSession();
                                              Navigator.pushNamedAndRemoveUntil(
                                                context, 
                                                "/dash", 
                                                (route) => false);
                                            }else{
                                              Navigator.pushNamed(
                                                context, "/dash");
                                            }
                                            
                                          } else {
                                            _dialogBuilder(context);
                                          }
                                        },
                                      ),
                                    }

                                  // Navigator.pushNamed(context, "/list"),
                                },

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => ListStudentsScreen(),)
                            // ),
                            child: Image.asset(
                              "assets/start.png",
                              height: 70,
                              scale: 0.5,
                            )),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/regis_user").then(
                              (_) async {
                                // print("Estoy regresando");
                                await _loadSaveData2();
                              },
                            );
                          },
                          child: Text("Registrarse"),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Color.fromARGB(190, 145, 163, 173),
          title: Text("Usuario o contraseña incorrectos"),
        );
      },
    );
  }
}
