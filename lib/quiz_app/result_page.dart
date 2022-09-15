// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/quiz_app/before_play_splash_screen.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final int usedTime;

  const ResultPage({
    Key key,
    @required this.score,
    @required this.usedTime,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  Future<void> firebasePutQuizResult() async {
    final User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('quiz_result')
        .doc();
    final jsonScore = {
      'score': widget.score,
      'take_time': widget.usedTime,
      'timestamp': DateTime.now(),
    };
    await docUser.set(jsonScore);
  }

  // CollectionReference _resultCollection = FirebaseFirestore.instance.collection(collectionPath)
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int score = widget.score;
    String soundAsset = (score >= 5
        ? score >= 7
            ? score >= 9
                ? 'sound/gold.wav'
                : 'sound/silver.wav'
            : 'sound/bronze.wav'
        : 'sound/congrats.wav');
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          firebasePutQuizResult();
          SoundServices().playAnswerSound(soundAsset);
          if (score == 10) {
            SoundServices().playAnswerSound('sound/gold10.mp3');
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  await SystemSound.play(SystemSoundType.click).then(
                    (value) => Navigator.of(context).pop(),
                  );
                },
              ),
              iconTheme: const IconThemeData(
                color: Color.fromARGB(255, 131, 177, 247),
              ),
              centerTitle: true,
              title: const Text(
                'Result',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 131, 177, 247),
                    fontSize: 24,
                    fontFamily: 'SukhumvitSet'),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: ResultBackgruond(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: SizedBox.expand(
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          height: size.height * 0.01,
                        ),
                      ),
                      Center(
                        child: buildMedal(widget.score),
                      ),
                      Flexible(
                        child: Center(
                          child: buildText(widget.score),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: size.height * 0.2,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(62, 185, 211, 250),
                          ),
                          width: size.width * 0.5,
                          height: size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  "Score: $score / 10",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'SukhumvitSet',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Flexible(
                                child: SizedBox(
                                  height: 16,
                                ),
                              ),
                              Flexible(
                                child: buildTime(widget.usedTime),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: size.height * 0.1,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await SystemSound.play(SystemSoundType.click)
                                    .then(
                                  (value) =>
                                      Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BeforePlaySplash(),
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 76, 212, 183),
                                fixedSize: const Size(170, 70),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.restart_alt_rounded,
                                    size: 30,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    "Play Again",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await SystemSound.play(SystemSoundType.click)
                                    .then(
                                  (value) => Navigator.of(context).pop(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 115, 180, 240),
                                fixedSize: const Size(170, 70),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.home_rounded,
                                    size: 30,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildTime(int usedTime) {
    Duration defaultTime = Duration(milliseconds: usedTime);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String threeDigits(int n) => n.toString().padLeft(3, '0');
    final seconds = twoDigits(defaultTime.inSeconds);
    final milliSeconds =
        threeDigits(defaultTime.inMilliseconds.remainder(1000));

    final timeColor = defaultTime.inMilliseconds > 30000
        ? defaultTime.inMilliseconds > 50000
            ? Colors.redAccent
            : Colors.orange
        : Colors.green;

    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          const TextSpan(
            text: "Time: ",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'SukhumvitSet',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "$seconds:$milliSeconds",
            style: TextStyle(
              color: timeColor,
              fontFamily: 'SukhumvitSet',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMedal(int score) {
    String result = (score >= 5
        ? score >= 7
            ? score >= 9
                ? 'assets/game_assets/result/gold.json'
                : 'assets/game_assets/result/silver.json'
            : 'assets/game_assets/result/bronze.json'
        : 'assets/game_assets/result/confirm.json');
    return Lottie.asset(
      result,
      height: 200,
      frameRate: FrameRate(60),
      repeat: false,
    );
  }

  Widget buildText(int score) {
    String resultText = (score >= 5
        ? score >= 7
            ? score >= 9
                ? 'Excellent!'
                : 'Awesome!'
            : 'Great Job!'
        : 'Not Bad!');
    return Text(
      resultText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromARGB(255, 46, 112, 211),
        fontFamily: 'SukhumvitSet',
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ResultBackgruond extends StatelessWidget {
  final Widget child;

  const ResultBackgruond({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Lottie.asset(
            'assets/game_assets/result/welldone.json',
            repeat: false,
            width: size.width * 0.8,
            alignment: Alignment.center,
            frameRate: FrameRate(60),
          ),
          /*Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/top2-1.png", width: size.width),
          ),
          Positioned(
            top: 78,
            right: 5,
            child:
                Image.asset("assets/images/main.png", width: size.width * 0.35),
          ),*/
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom1.png", width: size.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom2.png", width: size.width),
          ),
          // Positioned(
          //   bottom: 20,
          //   left: 20,
          //   child: Image.asset("assets/images/syringe1.png",
          //       width: size.width * 0.3),
          // ),
          child
        ],
      ),
    );
  }
}

class SoundServices {
  final AudioPlayer _player = AudioPlayer();
  Future<void> playAnswerSound(String soundSource) async {
    await _player.play(AssetSource(soundSource));
  }
}
