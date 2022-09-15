import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:knc_learn_app/Screens/login.dart';

class BeforeLoginSplashPage extends StatelessWidget {
  const BeforeLoginSplashPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/start_icon4.gif"),
      logoWidth: 100.0,
      title: const Text(
        "KNC LEARN",
        style: TextStyle(
          color: Color.fromARGB(255, 131, 177, 247),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'SukhumvitSet',
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loaderColor: const Color.fromARGB(255, 131, 177, 247),
      loadingText: const Text(
        "Loading...",
        style: TextStyle(
          color: Color.fromARGB(255, 131, 177, 247),
          fontFamily: 'SukhumvitSet',
        ),
      ),
      navigator: const LoginScreen(),
      durationInSeconds: 4,
    );
  }
}
