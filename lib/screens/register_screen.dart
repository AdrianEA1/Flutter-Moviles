import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CameraController? controller ;
  late List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  XFile? _capturedImage;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  String _nameUser = "";
  String _emailUser = "";
  String _passUser = "";
  String _path = "";



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if(controller != null){
      controller!.dispose();
    }
    super.dispose();
  }



  // Future<void> initCamera() async{
  // _cameras = await availableCameras();
  // controller = CameraController(_cameras![0], ResolutionPreset.max);
  // controller!.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {
  //       _isCameraInitialized = true;
  //     });
  //   }).catchError((Object e) {  
  //     if (e is CameraException) {
  //       switch (e.code) {
  //         case 'CameraAccessDenied':
            
  //           break;
  //         default:
            
  //           break;
  //       }
  //     }
  //   });
  // }

  // Capturar imagen
  // Future<void> captureImage() async {
  //   if (controller!.value.isInitialized) {
  //     try {
  //       final XFile image = await controller!.takePicture();
  //       setState(() {
  //         _capturedImage = image;
  //         _path = _capturedImage!.path;
  //         _selectedImage = null;
  //       });
  //     } catch (e) {
  //       print("Error al capturar imagen: $e");
  //     }
  //   }
  // }

  Future<void> _takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        _selectedImage = null;
      });
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
    print("Guardando datos: $_nameUser, $_emailUser, $_passUser, $image");
    // await prefs.clear();
    await prefs.setString("name", _nameUser);
    await prefs.setString("email", _emailUser);
    await prefs.setString("psw", _passUser);
    // await prefs.setBool("session", _holdSession);
    await prefs.setString("avatar", imagePath);
    Navigator.pop(context, true);
  }

  Future<void> _saveData2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Guardando datos: $_nameUser, $_emailUser, $_passUser");
    // await prefs.clear();
    await prefs.setString("name", _nameUser);
    await prefs.setString("email", _emailUser);
    await prefs.setString("psw", _passUser);
    // await prefs.setBool("session", _holdSession);
    await prefs.setString("avatar", "");
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
          decoration: BoxDecoration(

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
                Text(
                  "Escoge tu avatar o foto de perfil",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),
                _image != null
                  ? Image.file(File(_image!.path), height: 150,) : Container(),
                _selectedImage != null
                ? Image.file(File(_selectedImage!.path), height: 150,) : Container(),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        // initCamera();
                        _takePicture();
                        // _dialogBuilder(context);
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
                              // _path = _selectedImage!.path;
                              _image = null;
                            });
                          }
                          
                          // for (var element in result!.files) {
                          //   print(element.name);
                          // }
                        }
                      }, 
                      child: Text("Choose a picture ")),
                      
                  ],
                ),
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

