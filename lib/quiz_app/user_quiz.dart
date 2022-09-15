/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserQuiz {
  String user_id;
  final String quiz_id;
  final int score;
  final int takeTime;
  final DateTime timestamp;

  UserQuiz({
    this.user_id = '',
    @required this.quiz_id,
    @required this.score,
    @required this.takeTime,
    @required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'quiz_id': quiz_id,
        'score': score,
        'take_time': takeTime,
        'timestamp': timestamp,
      };

  static UserQuiz fromJson(Map<String, dynamic> json) => UserQuiz(
        quiz_id: json['quiz_id'],
        score: json['score'],
        takeTime: json['take_time'],
        timestamp: (json['timestamp'] as Timestamp).toDate(),
      );
}

*/