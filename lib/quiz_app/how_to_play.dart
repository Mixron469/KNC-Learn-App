// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/quiz_app/before_play_splash_screen.dart';
import 'package:knc_learn_app/quiz_app/leaderboard_page.dart';
// import 'package:knc_learn_app/quiz_app/recent_page.dart';

class HowToPlayPage extends StatefulWidget {
  const HowToPlayPage({Key key}) : super(key: key);

  @override
  State<HowToPlayPage> createState() => _HowToPlayPageState();
}

class _HowToPlayPageState extends State<HowToPlayPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: sized_box_for_whitespace
              Flexible(
                flex: 5,
                child: SizedBox(
                  height: size.height * 0.65,
                  child: TabBarView(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:
                              Image.asset("assets/game_assets/how_to_play.gif"),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(8),
                      //   child: const SingleChildScrollView(
                      //     child: RecentPage(),
                      //   ),
                      // ),
                      const Center(
                        child: SingleChildScrollView(
                          child: LeaderboardPage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 16,
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () async {
                    await SystemSound.play(SystemSoundType.click).then(
                      (value) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BeforePlaySplash(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    fixedSize: Size(size.width * 0.85, size.height * 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.play_circle_fill_rounded,
                        size: 48,
                        color: Colors.black54,
                      ),
                      Text(
                        "Go Play",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'SukhumvitSet',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(context) {
    return AppBar(
      // ignore: missing_required_param
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
      title: const Text(
        "Injection MiniQuiz",
        // style: TextStyle(color: Colors.black),
      ),
      automaticallyImplyLeading: false,
      titleTextStyle: const TextStyle(
        color: Color.fromARGB(255, 36, 93, 190),
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'SukhumvitSet',
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      shadowColor: Colors.transparent,
      elevation: 0,
      /*actions: [
          Center(child: buildTime()),
          const SizedBox(width: 16),
        ],*/
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 131, 177, 247), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      bottom: TabBar(
        onTap: (value) => SystemSound.play(SystemSoundType.click),
        padding: const EdgeInsets.all(8),
        indicator: ShapeDecoration(
            color: const Color.fromARGB(255, 170, 201, 248),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        // indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        tabs: const [
          Tab(
            child: Text(
              "How to play",
              style: TextStyle(
                fontFamily: "SukhumvitSet",
                fontSize: 18,
              ),
            ),
          ),
          // Tab(
          //   child: Text(
          //     "Recents",
          //     style: TextStyle(
          //       fontFamily: "SukhumvitSet",
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
          Tab(
            child: Text(
              "Leaderboards",
              style: TextStyle(
                fontFamily: "SukhumvitSet",
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
