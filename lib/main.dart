import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/auth_splash_screen.dart';
import 'package:knc_learn_app/Screens/before_login_splash.dart';
import 'package:knc_learn_app/Screens/home.dart';
import 'package:knc_learn_app/Screens/login.dart';
import 'package:knc_learn_app/quiz_app/result_page.dart';
import 'package:knc_learn_app/quiz_app/how_to_play.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int score;
    int usedTime;
    return MaterialApp(
      title: 'KNC Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 177, 206, 248),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthSplashPage(),
      routes: <String, WidgetBuilder>{
        'how_to_play': (BuildContext context) => const HowToPlayPage(),
        'result_page': (BuildContext context) =>
            ResultPage(score: score, usedTime: usedTime),
        'home': (BuildContext context) => const HomeScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'beforelogin': (BuildContext context) => const BeforeLoginSplashPage(),
      },
    );
  }
}
