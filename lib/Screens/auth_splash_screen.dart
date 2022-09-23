import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:knc_learn_app/Screens/before_login_splash.dart';
import 'package:knc_learn_app/Screens/home.dart';

class AuthSplashPage extends StatefulWidget {
  const AuthSplashPage({Key key}) : super(key: key);

  @override
  State<AuthSplashPage> createState() => _AuthSplashPageState();
}

class _AuthSplashPageState extends State<AuthSplashPage> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  bool autoLogin = true;
  Future<void> firebasePutAutoLoginTimeStamp() async {
    setState(() {
      final User user = FirebaseAuth.instance.currentUser;
      final uid = user.uid;

      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('login_timestamp')
          .doc();
      final jsonTrue = {
        'logindata_datetime': DateTime.now(),
        'auto_login': autoLogin,
      };
      if (autoLogin == true) {
        setState(() {
          docUser.set(jsonTrue);
          autoLogin == false;
        });
      }
    });
  }

  Future<void> authStateCheck() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User user) async {
        if (user != null) {
          setState(() async {
            await firebasePutAutoLoginTimeStamp().then((value) {
              Fluttertoast.showToast(msg: "Auto-Login Successful");
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            });
          });
        } else {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const BeforeLoginSplashPage()),
                (Route<dynamic> route) => false);
          });
        }
      },
    );
  }

  @override
  void initState() {
    authStateCheck();
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      autoLogin = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const Scaffold(
            backgroundColor: Color.fromARGB(255, 186, 209, 245),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Scaffold(
          backgroundColor: Color.fromARGB(255, 186, 209, 245),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    ); /*const Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 209, 245),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );*/
  }
}
