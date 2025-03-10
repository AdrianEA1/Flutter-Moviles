import 'dart:io';

import 'package:app/utils/global_value.dart';
import 'package:app/utils/theme_settings.dart';
// import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:app/utils/global_value.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _userName = "";
  String _email = "";
  String _image = "";
  String _font = "";
  int _theme = 0;
  // bool? _session;
  final _key = GlobalKey<ExpandableFabState>();

  void _loadSaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString("name")!;
      _email = prefs.getString("email")!;
      _image = prefs.getString("avatar") ?? "";
      // _session = prefs.getBool("session");
    });
    // print("Estos son: $_email, $_userName, $_image, $_session");
  }

  void _saveThemeData(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // _theme = value;
    await prefs.setInt("optTheme", value);
  }

  void _saveFontData(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("optFont", value);
  }

  Future<void> _saveSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("session", false);

    Navigator.pushNamedAndRemoveUntil(
      context, 
      "/login", 
      (route) => false);
  }

  void _changeFont(){
    if(_theme == 0){
      GlobalValue.themeApp.value = ThemeSettings.lightThemeFont(_font);
    }else if(_theme == 1){
      GlobalValue.themeApp.value = ThemeSettings.darkThemeFont(_font);
    }else{
      GlobalValue.themeApp.value = ThemeSettings.editThemeFont(_font);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSaveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        actions: [
          // DarlightButton(
          //   type: Darlights.DarlightOne,
          //   onChange: (value) {
          //     if(ThemeMode.light == value){
          //       GlobalValue.themeApp.value = ThemeSettings.lightTheme();
          //     }
          //     else{
          //       GlobalValue.themeApp.value = ThemeSettings.darkTheme();
          //     }
                
          //   },
          //   options: DarlightOneOption()
          // )
          // ThemeButton(
          //   onChanged: (value){
              
          //   },
          // )
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        children: [
          FloatingActionButton.small(
            child: Icon(Icons.sunny),
            onPressed: () {
              _theme = 0;
              GlobalValue.themeApp.value = ThemeData.light().copyWith(
                textTheme: ThemeData.light().textTheme.apply(fontFamily: _font)
              );
              _saveThemeData(0);
            },
          ),
          FloatingActionButton.small(
            child: Icon(Icons.dark_mode),
            onPressed: () {
              _theme = 1;
              GlobalValue.themeApp.value = ThemeData.dark().copyWith(
                textTheme: ThemeData.dark().textTheme.apply(fontFamily: _font)
              );
              _saveThemeData(1);
            },
          ),
          FloatingActionButton.small(
            child: Icon(Icons.color_lens),
            onPressed: () {
              _theme = 2;
              GlobalValue.themeApp.value = ThemeSettings.lightTheme().copyWith(
                textTheme: ThemeSettings.lightTheme().textTheme.apply(fontFamily: _font)
              );
              _saveThemeData(2);
            },
          ),
        ]
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // backgroundImage: NetworkImage("https://i.pravatar.cc/550"),
                backgroundImage: (_image != "") ? FileImage(File(_image)) : AssetImage('assets/user.png'),
                
              ),
              // currentAccountPicture: Container(
              //   height: 50,
              //   width: 50,
              //   child: Image.file(File(_image)),
              // ),
              accountName: Text(_userName),
              accountEmail: Text(_email)
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/bike');
              },
              leading: Icon(Icons.design_services_rounded),
              title: Text("Práctica Figma"),
              subtitle: Text("Frontend App"),
              trailing: Icon(Icons.charging_station_rounded),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/todo');
              },
              leading: Icon(Icons.task_alt_sharp),
              title: Text("Todo App"),
              subtitle: Text("Task list"),
              trailing: Icon(Icons.event_available_rounded),
            ),
            SizedBox(
              height: 50,
              width: 30,
              child: ElevatedButton(

                onPressed: () => {
                  _saveSession()
                }, 
                child: Row(

                  children: [
                    Text(
                      "Cerrar sesión",
                      style: TextStyle(
                        color: Color.fromARGB(255, 103, 103, 117),
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 103, 103, 117),
                      size: 16,
              
                    )
                  ],
                )),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Center(
              child: Text("Escoge una tipografia"),
              
            ),
            MaterialButton(
              onPressed: () { 
                _font = "Roboto";
                _saveFontData("Roboto");
                _changeFont();
                },
              child: Text(
                "Default", 
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto'
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _font = "Intel";
                _saveFontData("Intel");
                _changeFont();
                },
              child: Text(
                "Intel", 
                style: TextStyle(
                  fontFamily: 'Intel',
                  fontSize: 18
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _font = "Lato";
                _saveFontData("Lato");
                _changeFont();
                },
              child: Text(
                "Lato", 
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 18
                ),
              ),
            ),
            MaterialButton(
              onPressed: () { 
                _font = "Monse";
                _saveFontData("Monse");
                _changeFont();
                },
              child: Text(
                "Monse", 
                style: TextStyle(
                  fontFamily: 'Monse',
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}