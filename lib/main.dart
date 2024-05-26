import 'package:flutter/material.dart';
import 'package:loginpage/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:loginpage/pages/auth.dart';
import 'package:loginpage/pages/signup.dart';
import 'package:loginpage/pages/home.dart';
import 'package:loginpage/pages/display_page.dart';
import 'package:loginpage/pages/scan_page.dart';
import 'package:loginpage/pages/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ?
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyAw64vnYijxpN7Ikbp0KKy1IbK7SdNYl4A",
          appId: "1:816494665375:android:f67ca37ef0fbbe031d8caa",
          messagingSenderId: "816494665375",
          projectId: "fir-auth-app-60623",)
    )
    : await Firebase.initializeApp();
        runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Egypt',
        routes: {
          '/' : (context) => Auth(),
          'login': (context) => LoginPage(),
          'signup': (context) => SignupScreen(),
          '/upload': (context) => ScanScreen(),
          '/display': (context) => DisplayPage(),
          '/profile': (context) => HomePage(),
          '/services': (context) => Services(),
        },
    );
  }
}