import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Option {
  final bool isCorrect;
  final String optionImage;

  const Option({
    @required this.isCorrect,
    @required this.optionImage,
  });
}
