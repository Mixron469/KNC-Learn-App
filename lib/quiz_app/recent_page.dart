/*

import 'package:knc_learn_app/quiz_app/user_quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({Key key}) : super(key: key);

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  String userUrlImage;
  String nameofUser;
  String userEmail;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  Future<void> getDoc() async {
    final docRef = FirebaseFirestore.instance.collection('user').doc(uid);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        final userData = doc.data() as Map<String, dynamic>;
        userUrlImage = userData['urlprofilepic'];
        nameofUser = userData['frontname'] + ' ' + userData['lastname'];
        userEmail = userData['email'];
        // ignore: avoid_print
        print('\n {$userUrlImage} \n {$nameofUser} \n {$userEmail} \n');
      },
      onError: (e) => Fluttertoast.showToast(msg: "Error getting document: $e"),
    );
  }

  @override
  void initState() {
    getDoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle normalStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );

    return StreamBuilder(
        stream: readUser(uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong! ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            final userQuiz = snapshot.data;
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(userUrlImage) ??
                          const AssetImage('assets/images/main.png'),
                    ),
                    Flexible(
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: nameofUser, style: boldStyle),
                              TextSpan(text: userEmail, style: normalStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 16,
                ),
                ListView(
                  children: userQuiz.map(buildUserQuiz(userQuiz)).toList(),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget buildUserQuiz(UserQuiz userQuiz) {
    const TextStyle normalStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle bigBoldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    return Column(
      children: [
        ListTile(
          leading: Text(
            '${userQuiz.score}/10',
            style: bigBoldStyle,
          ),
          title: Text(
            '${userQuiz.takeTime}',
            style: boldStyle,
          ),
          subtitle: Text(
            '${userQuiz.timestamp}',
            style: normalStyle,
          ),
        ),
      ],
    );
  }

  Stream<List<UserQuiz>> readUser(String uid) => FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('quiz_result')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserQuiz.fromJson(doc.data())).toList());
}

*/