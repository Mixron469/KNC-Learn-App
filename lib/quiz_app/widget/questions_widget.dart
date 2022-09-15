// import "dart:math";
import 'package:flutter/material.dart';
import 'package:knc_learn_app/quiz_app/data/questions.dart';
import 'package:knc_learn_app/quiz_app/model/category.dart';
import 'package:knc_learn_app/quiz_app/model/option.dart';
import 'package:knc_learn_app/quiz_app/model/question.dart';
// import 'package:quiz_app_test/utils.dart';
// import 'package:quiz_app_test/widget/options_widget.dart';

// import '../model/category.dart';

class QuestionsWidget extends StatefulWidget {
  final Category category;
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;

  const QuestionsWidget({
    Key key,
    @required this.category,
    @required this.controller,
    @required this.onChangedPage,
    @required this.onClickedOption,
  }) : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) => PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: widget.onChangedPage,
        controller: widget.controller,
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];

          return buildQuestion(question: question);
        },
      );

  Widget buildQuestion({
    @required Question question,
  }) =>
      Container(
        padding: const EdgeInsets.all(8),
        /*decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 3,
          ),
        ),*/
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 240,
                    child: Image.asset(question.questionImage),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              question.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'SukhumvitSet',
              ),
              textAlign: TextAlign.left,
            ),
            /*const Text(
              "กรุณาเลือกคำตอบที่ถูกต้อง",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  fontFamily: 'SukhumvitSet'),
              textAlign: TextAlign.left,
            ),*/
            const SizedBox(height: 14),
            Expanded(
              flex: 2,
              child: OptionsWidget(
                question: question,
                onClickedOption: widget.onClickedOption,
              ),
            ),
          ],
        ),
      );
}

class OptionsWidget extends StatefulWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key key,
    @required this.question,
    @required this.onClickedOption,
  }) : super(key: key);

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  // ignore: prefer_typing_uninitialized_variables
  var randomOptions;

  @override
  void initState() {
    super.initState();
    buildListOptions();
  }

  @override
  Widget build(BuildContext context) {
    List listOptions = randomOptions;
    return SizedBox.expand(
      child: Center(
        child: Wrap(
          spacing: 32,
          runSpacing: 2,
          children: listOptions
              .map((option) => buildOption(context, option))
              .toList(),
          /*widget.question.options
                .map((option) => buildOption(context, option))
                .toList()
              ..shuffle(),*/
        ),
      ),
    );
  }

  void buildListOptions() {
    setState(() {
      randomOptions = widget.question.options..shuffle();
    });
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, widget.question);
    final isSelected = option == widget.question.selectedOption;
    // var pairs = partition(letters, 2);
    return GestureDetector(
      onTap: () => widget.onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 3,
            color: !isSelected ? Colors.black12 : color,
          ),
        ),
        child: Column(
          children: [
            buildAnswer(option),
            // buildSolution(question.selectedOption, option),
            /*const SizedBox(
              height: 8,
            )*/
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Option option) {
    final color = getColorForOption(option, widget.question);
    Size size = MediaQuery.of(context).size;
    return SizedBox.square(
      dimension: size.width * 0.37,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            width: size.width * 0.34,
            child: Image.asset(option.optionImage),
          )
        ],
      ),
    );
  }

  /*Widget buildSolution(Option solution, Option answer) {
    if (solution == answer) {
      return SizedBox(
        height: 18,
        child: Text(
          question.solution,
          style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
      );
    } else {
      return const SizedBox(
        height: 18,
      );
    }
  }*/
  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.transparent;
    } else {
      return option.isCorrect ? Colors.greenAccent : Colors.redAccent;
    }
  }
}
