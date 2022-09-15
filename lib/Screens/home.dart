import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/quiz_app/how_to_play.dart';
import 'package:knc_learn_app/widget/navigation_drawer_widget.dart';

import 'package:knc_learn_app/Screens/injectionSeries/inj_s1_drugcal/inj_s1_drugcal.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s2_equipment/inj_s2_equipment.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s3_estimation/inj_s3_estimation.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s4_prepare/inj_s4_prepare.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s5_injection/inj_s5_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 131, 177, 247),
        ),
        centerTitle: true,
        title: const Text(
          'KNC LEARN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 131, 177, 247),
            fontSize: 24,
            fontFamily: 'SukhumvitSet',
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            buildPadding(paddingText: "Injection Series"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Image.asset("assets/images/syringe_lottie.gif"),
                    ),
                  ),
                ),
                Flexible(
                  child: buildMenuItemSizedBox(
                      menuImage: const AssetImage("assets/images/menu/1.png"),
                      index: 1),
                ),
                Flexible(
                  child: buildMenuItemSizedBox(
                      menuImage: const AssetImage("assets/images/menu/2.png"),
                      index: 2),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: buildMenuItemSizedBox(
                      menuImage: const AssetImage("assets/images/menu/3.png"),
                      index: 3),
                ),
                Flexible(
                  child: buildMenuItemSizedBox(
                      menuImage: const AssetImage("assets/images/menu/4.png"),
                      index: 4),
                ),
                Flexible(
                  child: buildMenuItemSizedBox(
                      menuImage: const AssetImage("assets/images/menu/5.png"),
                      index: 5),
                ),
              ],
            ),
            const SizedBox(height: 30),
            buildPadding(paddingText: "Injection MiniGame"),
            const SizedBox(height: 10),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        await SystemSound.play(SystemSoundType.click).then(
                          (value) {
                            selectedSeries(context, 6);
                          },
                        );
                      },
                      child: SizedBox(
                        width: size.width * 0.9,
                        child: Image.asset("assets/images/menu/game.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItemSizedBox({
    @required AssetImage menuImage,
    @required int index,
  }) {
    return SizedBox(
      height: 115,
      width: 115,
      child: InkWell(
        splashColor: Colors.transparent,
        // focusColor: Colors.transparent,
        // hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await SystemSound.play(SystemSoundType.click).then(
            (value) {
              selectedSeries(context, index);
            },
          );
        },
        child: Ink.image(
          fit: BoxFit.cover, // Fixes border issues
          width: 115,
          height: 115,
          image: menuImage,
        ),
      ),
    );
  }

  Widget buildPadding({
    @required String paddingText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        paddingText,
        style: const TextStyle(
          color: Color.fromARGB(255, 131, 177, 247),
          fontSize: 18,
          fontFamily: 'SukhumvitSet',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void selectedSeries(BuildContext context, int index) {
    switch (index) {
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InjS1(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InjS2(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InjS3(),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InjS4(),
          ),
        );
        break;
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InjS5(),
          ),
        );
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HowToPlayPage(),
        ));
        break;
      default:
    }
  }
}
