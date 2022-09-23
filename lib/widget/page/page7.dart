import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knc_learn_app/Screens/home.dart';

class Page7 extends StatelessWidget {
  const Page7({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          'Admin',
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
      body: const BuildForm(),
    );
  }
}

class BuildForm extends StatefulWidget {
  const BuildForm({Key key}) : super(key: key);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final _formKey = GlobalKey<FormState>(); // form key
  final TextEditingController frontNameController =
      TextEditingController(); // editing controller
  final TextEditingController lastNameController =
      TextEditingController(); // editing controller
  final TextEditingController registerEmailController =
      TextEditingController(); // editing controller
  final TextEditingController registerPasswordController =
      TextEditingController(); // editing controller

  String errorMessage; // string for displaying the error Message

  @override
  void dispose() {
    frontNameController.dispose();
    lastNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final frontNameField = TextFormField(
      controller: frontNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Front Name");
        }
        return null;
      },
      onSaved: (value) {
        registerPasswordController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontFamily: 'SukhumvitSet'),
      decoration: const InputDecoration(
        labelText: "Front Name",
      ),
    );

    final lastNameField = TextFormField(
      controller: lastNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Last Name");
        }
        return null;
      },
      onSaved: (value) {
        registerPasswordController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontFamily: 'SukhumvitSet'),
      decoration: const InputDecoration(
        labelText: "Last Name",
      ),
    );

    final emailField = TextFormField(
      controller: registerEmailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter KNC Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@knc.ac.th").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        registerEmailController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: "KNC Email"),
      style: const TextStyle(fontFamily: 'SukhumvitSet'),
    );

    final passwordField = TextFormField(
      controller: registerPasswordController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Password");
        }
        return null;
      },
      onSaved: (value) {
        registerPasswordController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontFamily: 'SukhumvitSet'),
      decoration: const InputDecoration(
        labelText: "Password",
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
      backgroundColor: const Color.fromARGB(255, 86, 158, 124),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0),
    );

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Create User",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 131, 177, 247),
                    fontSize: 24,
                    fontFamily: 'SukhumvitSet'),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: frontNameField,
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: lastNameField,
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
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                style: loginButton,
                onPressed: () async {
                  await SystemSound.play(SystemSoundType.click).then(
                    (value) {
                      createUser(
                        frontName: frontNameController.text,
                        lastName: lastNameController.text,
                        email: registerEmailController.text,
                        password: registerPasswordController.text,
                      );
                    },
                  );
                },
                child: const Text(
                  "CREATE",
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
    );
  }

  /*
  static Future<UserCredential> register(String email, String password) async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Do something with exception. This try/catch is here to make sure
      // that even if the user creation fails, app.delete() runs, if is not,
      // next time Firebase.initializeApp() will fail as the previous one was
      // not deleted.
    }

    await app.delete();
    return Future.sync(() => userCredential);
  }
  */

  Future<void> createUser({
    String frontName,
    String lastName,
    String email,
    String password,
  }) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseApp app = await Firebase.initializeApp(
          name: 'Secondary', options: Firebase.app().options);
      UserCredential userCredential;
      try {
        userCredential = await FirebaseAuth.instanceFor(app: app)
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          final uid = value.user.uid;
          final docUser =
              FirebaseFirestore.instance.collection('users').doc(uid);
          final jsonCreateUser = {
            'email': email,
            'frontname': frontName,
            'lastname': lastName,
            'password': password,
            'urlprofilepic':
                'https://png.pngitem.com/pimgs/s/130-1300380_female-user-image-icon-hd-png-download.png',
          };
          await docUser.set(jsonCreateUser).then((value) {
            _formKey.currentState.reset();
            Fluttertoast.showToast(msg: "Create User $email Successful");
            FocusManager.instance.primaryFocus?.unfocus();
          });
          await app.delete();
          return Future.sync(() => userCredential);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "email-already-in-use":
            errorMessage = "KNC Email address is already in used.";
            break;
          case "invalid-email":
            errorMessage = "KNC Email address is invalid.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
      }
      await app.delete();
      return Future.sync(() => userCredential);
    }
  }
}
