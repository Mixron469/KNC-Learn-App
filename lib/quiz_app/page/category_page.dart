import 'dart:async';
// import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart';
// ignore: depend_on_referenced_packages
import 'package:quiver/async.dart';

import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:knc_learn_app/quiz_app/data/questions.dart';
import 'package:knc_learn_app/quiz_app/model/category.dart';
import 'package:knc_learn_app/quiz_app/model/option.dart';
import 'package:knc_learn_app/quiz_app/model/question.dart';
import 'package:knc_learn_app/quiz_app/result_page.dart';
import 'package:knc_learn_app/quiz_app/widget/questions_widget.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage({Key key, @required this.category}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  PageController controller = PageController(
    initialPage: 0,
  );
  Question question;
  int startTime = 61000;
  int currentTime = 61000;
  int usedTime = 0;
  int score = 0;
  List numberColor = [];
  Color currentColor;
  // int startTime = 20000;
  // int currentTime = 20000;

  AnimationController _animationController;
  CountdownTimer countDownTimer;

  @override
  void initState() {
    super.initState();
    score = 0;
    numberColor = [];
    question = widget.category.questions.first;
    // resetOption();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.addStatusListener((status) async {
      await Future.delayed(const Duration(milliseconds: 500), () {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(score: score, usedTime: usedTime)),
              (Route<dynamic> route) => route.isFirst);
        }
      });
    });
    startTimer();
  }

  Future<void> startTimer() async {
    countDownTimer = CountdownTimer(
      Duration(milliseconds: startTime),
      const Duration(milliseconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData(
      (duration) async {
        setState(() {
          currentTime = startTime - duration.elapsed.inMilliseconds;
        });
      },
    );
    sub.onDone(() async {
      if (currentTime < 10) {
        setState(() {
          currentTime = 0;
          usedTime = 60000;
        });
        showEndDialog(
            lottieAsset: 'assets/game_assets/bell_notify.json',
            endText: "-  Timed Out!!  -",
            endTextColor: Colors.redAccent,
            soundAsset: 'sound/timeout.wav');
      } else {
        setState(() {
          usedTime = 60000 - currentTime;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: QuestionsWidget(
          category: widget.category,
          controller: controller,
          onChangedPage: (index) => nextQuestion(),
          onClickedOption: selectOption,
        ),
      );

  Widget buildAppBar(context) => AppBar(
        title: Center(
          child: buildTime(),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: QuestionNumbersWidget(
              questions: widget.category.questions,
              question: question,
              numberColor: numberColor,
              currentColor: currentColor,
              /*onClickedNumber: (index) =>
                  nextQuestion(index: index, jump: true),*/
            ),
          ),
        ),
      );

  Future<void> selectOption(Option option) async {
    if (!question.isLocked) {
      setState(() {
        option.isCorrect
            ? SoundServices().playAnswerSound('sound/correct.mp3')
            : SoundServices().playAnswerSound('sound/wrong.mp3');
        question.isLocked = true;
        question.selectedOption = option;
        if (option.isCorrect) {
          score++;
          currentColor = Colors.greenAccent;
          numberColor.add(const Color(0xff69f0ae));
        } else {
          currentColor = Colors.redAccent;
          numberColor.add(const Color(0xffff5252));
        }
        nextQuestion(jump: true);
      });
    }
  }

  Widget buildTime() {
    Duration defaultTime = Duration(milliseconds: currentTime);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String threeDigits(int n) => n.toString().padLeft(3, '0');
    final seconds = twoDigits(defaultTime.inSeconds);
    final milliSeconds =
        threeDigits(defaultTime.inMilliseconds.remainder(1000));

    final timeColor = defaultTime.inMilliseconds > 30000
        ? Colors.white
        : defaultTime.inMilliseconds > 10000
            ? Colors.yellow
            : Colors.redAccent;

    return Text(
      '$seconds:$milliSeconds',
      style: TextStyle(
        color: timeColor,
        fontFamily: 'SukhumvitSet',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future<void> nextQuestion({bool jump = false}) async {
    final nextPage = controller.page + 1;
    if (jump) {
      await Future.delayed(const Duration(seconds: 1));
      if (nextPage < 10) {
        setState(() {
          questions[nextPage.toInt()].isLocked = false;
          question = widget.category.questions[nextPage.toInt()];
        });
        // resetOption();
        controller.animateToPage(
          nextPage.toInt(),
          duration: const Duration(milliseconds: 250),
          curve: Curves.decelerate,
        );
      } else {
        setState(() {
          showEndDialog(
              lottieAsset: 'assets/game_assets/success.json',
              endText: "-  Finished!  -",
              endTextColor: Colors.green,
              soundAsset: 'sound/finish.wav');
        });
      }
    }
  }

  Future<void> showEndDialog({
    String lottieAsset,
    String endText,
    Color endTextColor,
    bool endTimer,
    String soundAsset,
  }) async {
    countDownTimer.cancel();
    await SoundServices().playAnswerSound(soundAsset);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          padding: const EdgeInsets.all(12),
          /*decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                lottieAsset,
                //'assets/bell_notify.json',
                // 'assets/success.json',
                repeat: false,
                controller: _animationController,
                onLoaded: (composition) {
                  _animationController.forward();
                },
              ),
              Text(
                endText,
                // "-  Timed Out!!  -",
                // "-  Finished!  -",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'SukhumvitSet',
                  fontWeight: FontWeight.bold,
                  color: endTextColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionNumbersWidget extends StatefulWidget {
  final List<Question> questions;
  final Question question;
  final List numberColor;
  final Color currentColor;
  // final ValueChanged<int> onClickedNumber;

  const QuestionNumbersWidget({
    Key key,
    @required this.questions,
    @required this.question,
    @required this.numberColor,
    @required this.currentColor,
    // @required this.onClickedNumber,
  }) : super(key: key);

  @override
  State<QuestionNumbersWidget> createState() => _QuestionNumbersWidgetState();
}

class _QuestionNumbersWidgetState extends State<QuestionNumbersWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Container(width: 8),
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final isSelected = widget.question == widget.questions[index];
          return buildNumber(
            index: index,
            isSelected: isSelected,
            numberColor: widget.numberColor,
            question: widget.question,
            currentColor: widget.currentColor,
            questions: widget.questions,
          );
        },
      ),
    );
  }

  Widget buildNumber({
    @required int index,
    @required bool isSelected,
    @required List numberColor,
    @required Question question,
    @required Color currentColor,
    @required List<Question> questions,
    // @required bool isLocked,
    // @required Option selectedOption,
  }) {
    // indexCheck(index);

    Color selectedColor(int index) {
      if (isSelected) {
        return question.isLocked ? currentColor : Colors.orange.shade300;
      } else {
        return questions[index].isLocked ? numberColor[index] : Colors.white;
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: selectedColor(index),
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'SukhumvitSet',
            ),
          ),
        ),
      ],
    );
  }
}

class SoundServices {
  final AudioPlayer _player = AudioPlayer();
  Future<void> playAnswerSound(String soundSource) async {
    await _player.play(AssetSource(soundSource));
  }
}
