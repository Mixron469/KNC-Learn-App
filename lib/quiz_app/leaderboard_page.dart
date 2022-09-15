// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    /*final docRef = FirebaseFirestore.instance.collection('users');
    docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
    })*/

    return /*StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView(children: snapshot.data.docs.map((Document) {
              })),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });*/
        Column(
      children: const [
        SizedBox(
          child: Text(
            '" Coming Soon... "',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'SukhumvitSet',
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 170, 201, 248),
            ),
          ),
        )
        /*ListView.builder(
          itemBuilder: ((context, index) => const RankingView()),
        ),*/
      ],
    );
  }

  /*Stream<List<User>> readUsers() {
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => fromJson(doc.data())).toList());
  }

  static User fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        frontname: json['frontname'],
        lastname: json['lastname'],
        urlprofilepic: json['urlprofilepic'],
      );*/
}

class RankingView extends StatelessWidget {
  const RankingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 170, 201, 248),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        height: 50,
        color: Colors.blueAccent,
      ),
    );
  }
}
