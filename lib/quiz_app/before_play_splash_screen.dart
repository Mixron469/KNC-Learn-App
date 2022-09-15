// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:knc_learn_app/quiz_app/data/questions.dart';
import 'package:knc_learn_app/quiz_app/model/category.dart';
import 'package:knc_learn_app/quiz_app/model/question.dart';
import 'package:knc_learn_app/quiz_app/page/category_page.dart';

class BeforePlaySplash extends StatefulWidget {
  const BeforePlaySplash({Key key}) : super(key: key);

  @override
  State<BeforePlaySplash> createState() => _BeforePlaySplashState();
}

class _BeforePlaySplashState extends State<BeforePlaySplash>
    with TickerProviderStateMixin {
  AnimationController _controller;
  List<Question> question;
  Category category;
  List<int> index = [];

  @override
  void initState() {
    super.initState();
    category = Category(questions: questions);
    question = category.questions;
    for (int i = 0; i < category.questions.length; i++) {
      index.add(i);
    }
    resetOption(index);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void resetOption(List<int> index) {
    setState(() {
      for (var element in index) {
        // bool before = question[element].isLocked;
        question[element].isLocked = false;
        question[element].selectedOption = null;
        // bool after = question[element].isLocked;
        // ignore: avoid_print
        // print("$before -- | $element | --  $after");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shadowColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 131, 177, 247), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/game_assets/321go.json',
          controller: _controller,
          frameRate: FrameRate(60),
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(
                () => Navigator.of(context).pushReplacement(
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: CategoryPage(
                      category: Category(
                        questions: questions,
                      ),
                    ),
                  ),
                  /*MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      category: Category(
                        questions: questions,
                      ),
                    ),
                  ),*/
                ),
              );
          },
        ),
      ),
    );
  }
}
