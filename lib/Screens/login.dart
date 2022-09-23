import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/home.dart';
import 'package:knc_learn_app/Screens/password_recov.dart';
import 'package:knc_learn_app/Screens/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final _formKey = GlobalKey<FormState>(); // form key
  final TextEditingController emailController =
      TextEditingController(); // editing controller
  final TextEditingController passwordController =
      TextEditingController(); // editing controller
  bool _obscureTextState = true;

  String errorMessage; // string for displaying the error Message

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final emailField = TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return ("Please Enter Your KNC Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@knc.ac.th").hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(labelText: "KNC Email"),
        style: const TextStyle(fontFamily: 'SukhumvitSet'));

    final passwordField = TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Your Password");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value;
      },
      textInputAction: TextInputAction.next,
      obscureText: _obscureTextState,
      style: const TextStyle(fontFamily: 'SukhumvitSet'),
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          icon:
              Icon(_obscureTextState ? Icons.visibility : Icons.visibility_off),
          onPressed: () async {
            await SystemSound.play(SystemSoundType.click).then(
              (value) {
                setState(
                  () {
                    _obscureTextState = !_obscureTextState;
                  },
                );
              },
            );
          },
        ),
      ),
    );

    final ButtonStyle loginButton = ElevatedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      // onPrimary: Colors.white,
      shadowColor: Colors.transparent,
      // overlayColor: ,
      elevation: 0,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.transparent,
      fixedSize: const Size(200, 50),
      backgroundColor: const Color.fromARGB(255, 255, 177, 41),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0),
    );

    return Scaffold(
      body: login_background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36,
                      fontFamily: 'SukhumvitSet'),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: emailField,
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: passwordField,
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PasswordRecoveryScreen()))
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  style: loginButton,
                  onPressed: () async {
                    await SystemSound.play(SystemSoundType.click).then(
                      (value) {
                        signIn(emailController.text, passwordController.text);
                      },
                    );
                  },
                  child: const Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SukhumvitSet',
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      trySignIn(email, password);
    }
  }

  Future<void> firebasePutLoginTimeStamp() async {
    bool manualLogin = false;
    setState(() {
      final User user = FirebaseAuth.instance.currentUser;
      final uid = user.uid;

      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('login_timestamp')
          .doc();
      final jsonFalse = {
        'logindata_datetime': DateTime.now(),
        'auto_login': manualLogin,
      };

      if (manualLogin == false) {
        setState(() {
          docUser.set(jsonFalse).then((value) {
            setState(() {
              manualLogin == true;
            });
          });
        });
      }
    });
  }

  Future<void> trySignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) async => {
                await firebasePutLoginTimeStamp().then((value) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Utils.showSnackBar(
                      text: "Login Successful", color: Colors.green);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false);
                }),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your KNC Email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this KNC Email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this KNC Email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage =
              "Signing in with KNC Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Utils.showSnackBar(text: errorMessage, color: Colors.redAccent);
      // ignore: avoid_print
      print(error.code);
    }
  }
}

// ignore: camel_case_types
class login_background extends StatelessWidget {
  final Widget child;

  const login_background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/top1-1.png", width: size.width),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/top2-1.png", width: size.width),
          ),
          Positioned(
            top: 78,
            right: 5,
            child:
                Image.asset("assets/images/main.png", width: size.width * 0.35),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom1.png", width: size.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom2.png", width: size.width),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Image.asset("assets/images/syringe1.png",
                width: size.width * 0.3),
          ),
          child
        ],
      ),
    );
  }
}
