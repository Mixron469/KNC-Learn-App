import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/login.dart';
import 'package:knc_learn_app/Screens/snackbar.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  final _formKey = GlobalKey<FormState>();
  // form key
  final TextEditingController emailController = TextEditingController();
  // editing controller
  String errorMessage;
  // string for displaying the error Message

  @override
  void dispose() {
    emailController.dispose();
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
      style: const TextStyle(fontFamily: 'SukhumvitSet'),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
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
                  "Please enter your KNC-Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 20,
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
                        reset(emailController.text);
                      },
                    );
                  },
                  child: const Text(
                    "RESET",
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

  void reset(String email) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      tryReset(email);
    }
  }

  Future<void> tryReset(String email) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        FocusManager.instance.primaryFocus?.unfocus();
        Utils.showSnackBar(
            text: 'Password Reset Email Sent', color: Colors.green);
        _formKey.currentState.reset();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
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
      Navigator.of(context).pop();
      // ignore: avoid_print
      print(error.code);
    }
  }
}
