// ignore_for_file: file_names
// import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/before_login_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:knc_learn_app/Screens/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final auth = FirebaseAuth.instance;
  String prefsName;
  String prefsUrlImage;
  final docUserName = FirebaseFirestore.instance.collection('users');

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

  Future<void> prefsGetString() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefsName = prefs.getString('name');
      prefsUrlImage = prefs.getString('urlImage');
    });
  }

  Future<void> prefsSetString({
    @required String name,
    @required String urlImage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('name', name);
      prefs.setString('urlImage', urlImage);
    });
  }

  @override
  void initState() {
    prefsGetString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = auth.currentUser?.email;
    final size = MediaQuery.of(context).size;

    final ButtonStyle signOutButton = ElevatedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      // onPrimary: Colors.white,
      backgroundColor: const Color.fromARGB(255, 221, 98, 98),
      shadowColor: Colors.transparent,
      // overlayColor: ,
      elevation: 0,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.transparent,
      fixedSize: Size(size.width * 0.4, size.height * 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // primary: const Color.fromARGB(255, 255, 177, 41),
      // padding: const EdgeInsets.all(0),
    );

    final ButtonStyle goBackButton = ElevatedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      // onPrimary: Colors.white,
      backgroundColor: const Color.fromARGB(255, 100, 165, 197),
      shadowColor: Colors.transparent,
      // overlayColor: ,
      elevation: 0,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.transparent,
      fixedSize: Size(size.width * 0.4, size.height * 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // primary: const Color.fromARGB(255, 255, 177, 41),
      // padding: const EdgeInsets.all(0),
    );

    final ButtonStyle defaultButton = ElevatedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      // onPrimary: Colors.white,
      backgroundColor: const Color.fromARGB(255, 100, 165, 197),
      shadowColor: Colors.transparent,
      // overlayColor: ,
      elevation: 0,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.transparent,
      fixedSize: Size(size.width * 0.4, size.height * 0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // primary: const Color.fromARGB(255, 255, 177, 41),
      // padding: const EdgeInsets.all(0),
    );

    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: docUserName.doc(auth.currentUser.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.hasData) {
            if (prefsName != null && prefsUrlImage != null) {
              return InfoPage(
                context: context,
                name: prefsName,
                urlImage: prefsUrlImage,
                email: email,
                defaultButton: defaultButton,
                signOutButton: signOutButton,
                goBackButton: goBackButton,
              );
            } else {
              final data = snapshot.data.data();
              final String frontName = data['frontname'];
              final String lastName = data['lastname'];
              final String urlImage = data['urlprofilepic'];
              final String name = '$frontName $lastName';
              prefsSetString(name: name, urlImage: urlImage);
              return InfoPage(
                context: context,
                name: name,
                urlImage: urlImage,
                email: email,
                defaultButton: defaultButton,
                signOutButton: signOutButton,
                goBackButton: goBackButton,
              );
            }
          }
          return InfoPage(
            context: context,
            name: prefsName ?? 'User Name',
            urlImage: prefsUrlImage ??
                'https://png.pngitem.com/pimgs/s/130-1300380_female-user-image-icon-hd-png-download.png',
            email: email,
            signOutButton: signOutButton,
          );
        });
  }

  // ignore: non_constant_identifier_names
  Widget InfoPage({
    BuildContext context,
    @required String urlImage,
    @required String name,
    @required String email,
    ButtonStyle defaultButton,
    ButtonStyle signOutButton,
    ButtonStyle goBackButton,
  }) {
    final size = MediaQuery.of(context).size;
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: size.width * 0.17,
                  backgroundImage: NetworkImage(urlImage),
                ),
                Container(
                  width: size.width * 0.07,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontFamily: "SukhumvitSet",
                          color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      email,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "SukhumvitSet",
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: defaultButton,
                      child: const Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "SukhumvitSet",
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        await SystemSound.play(SystemSoundType.click).then(
                          (value) async {
                            // await _signOut(context);
                          },
                        );
                      },
                    ),
                    ElevatedButton(
                      style: defaultButton,
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "SukhumvitSet",
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        await SystemSound.play(SystemSoundType.click).then(
                          (value) async {
                            await showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              builder: (context) {
                                return Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Are you sure?',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: "SukhumvitSet",
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        height: size.height * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: goBackButton,
                                            child: const Text(
                                              "Go Back",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: "SukhumvitSet",
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () async {
                                              await SystemSound.play(
                                                      SystemSoundType.click)
                                                  .then(
                                                (value) async {
                                                  await _signOut(context);
                                                },
                                              );
                                            },
                                          ),
                                          ElevatedButton(
                                            style: signOutButton,
                                            child: const Text(
                                              "Sign Out",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: "SukhumvitSet",
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () async {
                                              await SystemSound.play(
                                                      SystemSoundType.click)
                                                  .then(
                                                (value) async {
                                                  await _signOut(context);
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
