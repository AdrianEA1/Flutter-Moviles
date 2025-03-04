import 'dart:io';

import 'package:app/utils/global_value.dart';
import 'package:app/utils/theme_settings.dart';
import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
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

  void _loadSaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString("name")!;
      _email = prefs.getString("email")!;
      _image = prefs.getString("avatar")!;
    });
    print("Estos son: $_email, $_userName, $_image");
  }

  Future<void> _saveSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("session", false);

    Navigator.pushNamedAndRemoveUntil(
      context, 
      "/login", 
      (route) => false);
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
        title: Text("Bien-venido"),
        actions: [
          DarlightButton(
            type: Darlights.DarlightOne,
            onChange: (value) {
              if(ThemeMode.light == value){
                GlobalValue.themeApp.value = ThemeSettings.lightTheme();
              }
              else{
                GlobalValue.themeApp.value = ThemeSettings.darkTheme();
              }
                
            },
            options: DarlightOneOption()
          )
          // ThemeButton(
          //   onChanged: (value){
              
          //   },
          // )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              // currentAccountPicture: CircleAvatar(
              //   // backgroundImage: NetworkImage("https://i.pravatar.cc/550"),
              //   backgroundImage: Image.file(File(_image)),
                
              // ),
              currentAccountPicture: Container(
                height: 50,
                width: 50,
                child: Image.file(File(_image)),
              ),
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
            ElevatedButton(
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
              ))
          ],
        ),
      ),
      // endDrawer: Drawer(),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}