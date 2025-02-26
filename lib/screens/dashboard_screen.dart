import 'package:app/utils/global_value.dart';
import 'package:app/utils/theme_settings.dart';
import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
// import 'package:app/utils/global_value.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/550"),
              ),
              accountName: Text("Adrián Estrada"),
              accountEmail: Text("21030975@itcelaya.edu.mx")
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/bike_product');
              },
              leading: Icon(Icons.design_services_rounded),
              title: Text("Práctica Figma"),
              subtitle: Text("Frontend App"),
              trailing: Icon(Icons.charging_station_rounded),
            )
          ],
        ),
      ),
      // endDrawer: Drawer(),
    );
  }
}