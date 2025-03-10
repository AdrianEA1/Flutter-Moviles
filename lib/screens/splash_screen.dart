import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:app/screens/dashboard_screen.dart';
// import 'package:app/screens/dashboard_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/utils/global_value.dart';
import 'package:app/utils/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _session = false;
  String? _font;
  int? _theme;

  @override
  void initState() {
    super.initState();
    _loadSession();
    _loadSettingsFontTheme();
    // _changeFontTheme();
  }

  Future<void> _loadSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _session = prefs.getBool("session") ?? false;
    });
    
  }

  void _loadSettingsFontTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _font = prefs.getString("optFont") ?? "Roboto";
      _theme = prefs.getInt("optTheme") ?? 0;
    });
    _changeFontTheme();
  }

  void _changeFontTheme(){
    print("Estos son: $_font, $_theme");
    if(_theme == 0){
      GlobalValue.themeApp.value = ThemeSettings.lightThemeFont(_font);
    }else if(_theme == 1){
      GlobalValue.themeApp.value = ThemeSettings.darkThemeFont(_font);
    }else{
      GlobalValue.themeApp.value = ThemeSettings.editThemeFont(_font);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: const Duration(seconds: 5),
        nextScreen: (!_session) ? const LoginScreen() : const DashboardScreen(),
        // nextScreen: const DashboardScreen(),
        // backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset(
            "assets/tecnmjson.json",
            repeat: false
          ),
        ),
      ),
    );
  }
}