// ignore_for_file: file_names
// import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/before_login_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:knc_learn_app/Screens/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle signOutButton = ElevatedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      // onPrimary: Colors.white,
      shadowColor: Colors.transparent,
      // overlayColor: ,
      elevation: 0,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.transparent,
      // fixedSize: const Size(150, 20),
      // primary: const Color.fromARGB(255, 255, 177, 41),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      // padding: const EdgeInsets.all(0),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            await SystemSound.play(SystemSoundType.click).then(
              (value) {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop();
              },
            );
          },
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 131, 177, 247),
        ),
        centerTitle: true,
        title: const Text(
          'User Info',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 131, 177, 247),
              fontSize: 18,
              fontFamily: 'SukhumvitSet'),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: signOutButton,
                child: const Text("Sign Out"),
                onPressed: () async {
                  await SystemSound.play(SystemSoundType.click).then(
                    (value) async {
                      await _signOut(context);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await FirebaseAuth.instance.signOut().then(
      (value) {
        SystemSound.play(SystemSoundType.click).then((value) {
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const BeforeLoginSplashPage(),
              ),
              (Route<dynamic> route) => false);
        });
      },
    );
  }
}
