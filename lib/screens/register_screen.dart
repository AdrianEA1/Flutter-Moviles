import 'dart:io';

import 'package:app/utils/global_value.dart'; 
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  String _nameUser = "";
  String _emailUser = "";
  String _passUser = "";
  // String _path = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> _takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        _selectedImage = null;
      });
      GlobalValue.updAvatar.value = !GlobalValue.updAvatar.value;
    }
  }

  Future<String> saveImageToStorage(File image) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagePath = '${directory.path}/user_image.jpg';
  final newImage = await image.copy(imagePath);
  return newImage.path;
  }


  Future<void> _saveData(File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final imagePath = await saveImageToStorage(image);
    // print("Guardando datos: $_nameUser, $_emailUser, $_passUser, $image");
    // await prefs.clear();
    await prefs.setString("name", _nameUser);
    await prefs.setString("email", _emailUser);
    await prefs.setString("psw", _passUser);
    await prefs.setString("avatar", imagePath);
    Navigator.pop(context, true);
  }

  Future<void> _saveData2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", _nameUser);
    await prefs.setString("email", _emailUser);
    await prefs.setString("psw", _passUser);
    await prefs.remove("avatar");
    Navigator.pop(context, true);
  }

  RegExp exp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
      caseSensitive: false);

  FilePickerResult? result;

  final _formKey = GlobalKey<FormState>();

  TextEditingController contrNombre = TextEditingController();
  TextEditingController contrEmail = TextEditingController();
  TextEditingController contrPaswrd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 100, 100, 190),
      ),
      body: Center(

        child: Container(
          
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xAAf1e7de), Color(0xAAf2efe5), Color(0xAAf1f7ea)]),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(186, 115, 115, 135),
              width: 2
            )
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                
                Center(
                  child: Text(
                    "Registro",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Escoge tu avatar o foto de perfil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,

                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: GlobalValue.updAvatar,
                  builder: (context, value, child) {
                    return Center(
                    child: CircleAvatar(
                      foregroundImage: _image != null ? FileImage(_image!) : _selectedImage != null ? FileImage(_selectedImage!) : AssetImage("assets/user.png"),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                  );
                  },
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        _takePicture();
                      },
                      child: Text("Take photo"),),
                    ElevatedButton(
                      onPressed: () async {
                        result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg']
                        );
                        if(result == null){
                          print("Objeto s");
                        }else{
                          if(result != null && result!.files.isNotEmpty){
                            setState(() {
                              _selectedImage = File(result!.files.single.path!);
                              _image = null;
                            });
                            GlobalValue.updAvatar.value = !GlobalValue.updAvatar.value;
                          }
                        }
                      }, 
                      child: Text("Choose a picture ")),
                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Ingrese un nombre';
                    }
                    _nameUser = value;
                      return null;
                  },
                  controller: contrNombre,
                  decoration: InputDecoration(
                    hintText: "Ingresa tu nombre",
                    prefixIcon: Icon(Icons.person),
                    labelText: "Nombre",
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Ingrese un email';
                    }
                    else if(!exp.hasMatch(value)){
                      return 'Ingrese un email valido';
                    }
                    _emailUser = value;
                      return null;
                  },
                  controller: contrEmail,
                  decoration: InputDecoration(
                    hintText: "Ingresa tu correo",
                    prefixIcon: Icon(Icons.email),
                    labelText: "Correo",
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Ingrese una contraseña';
                    }
                    _passUser = value;
                    return null;
                  },
                  obscureText: true,
                  controller: contrPaswrd,
                  decoration: InputDecoration(
                    hintText: "Ingresa tu contraseña",
                    prefixIcon: Icon(Icons.password),
                    labelText: "Contraseña",
                  ),
                ),
                SizedBox(height: 20,),
                
                SizedBox(height: 20,),
                ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Procesando..."))
                            );
                            if(_selectedImage != null){
                              _saveData(_selectedImage!);
                            }else if( _image != null){
                              _saveData(_image!);
                            }else{
                              _saveData2();
                            }

                          }
                        }, 
                        child: Text("Registrase"))
              ],
            ),
          ),
        ),
      ),
    );
  }


}

