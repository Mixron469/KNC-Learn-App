// import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'option.dart';

class Question {
  final String text;
  final List<Option> options;
  final String questionImage;
  bool isLocked;
  Option selectedOption;

  Question({
    @required this.text,
    @required this.options,
    @required this.questionImage,
    this.isLocked = false,
    this.selectedOption,
  });
}
