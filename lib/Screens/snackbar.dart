import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar({String text, Color color}) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'SukhumvitSet',
        ),
      ),
      backgroundColor: color,
    );

    messengerKey.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
