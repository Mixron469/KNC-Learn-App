import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s4_prepare/prepare_ampule.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s4_prepare/prepare_nss.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s4_prepare/prepare_vial.dart';

class InjS4 extends StatefulWidget {
  const InjS4({Key key}) : super(key: key);

  @override
  State<InjS4> createState() => _InjS4State();
}

class _InjS4State extends State<InjS4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            await SystemSound.play(SystemSoundType.click).then(
              (value) {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop();
              },
            );
          },
          // => Navigator.of(context).popUntil(ModalRoute.withName("/HomeScreen")),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 131, 177, 247),
        ),
        centerTitle: true,
        title: const Text(
          'การเตรียมยาฉีด',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 131, 177, 247),
              fontSize: 18,
              fontFamily: 'SukhumvitSet'),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox.expand(
        // width: double.infinity,
        // height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: buildMenuItemSizedBox(
                menuImage: const AssetImage("assets/images/Inj_s4/Ampule.gif"),
                index: 1,
                size: size,
              ),
            ),
            Flexible(
              flex: 1,
              child: buildMenuItemSizedBox(
                menuImage: const AssetImage("assets/images/Inj_s4/Vial.gif"),
                index: 2,
                size: size,
              ),
            ),
            Flexible(
              flex: 1,
              child: buildMenuItemSizedBox(
                menuImage: const AssetImage("assets/images/Inj_s4/Nss.gif"),
                index: 3,
                size: size,
              ),
            ),
            Container(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItemSizedBox({
    @required AssetImage menuImage,
    @required int index,
    @required Size size,
  }) {
    return Container(
      //height: size.height * 0.5,
      //width: 115,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        // focusColor: Colors.transparent,
        // hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await SystemSound.play(SystemSoundType.click).then(
            (value) {
              FocusManager.instance.primaryFocus?.unfocus();
              selectedSeries(context, index);
            },
          );
        },
        child: Ink.image(
          fit: BoxFit.fitHeight, // Fixes border issues
          //width: 115,
          //height: 115,
          image: menuImage,
        ),
      ),
    );
  }

  void selectedSeries(BuildContext context, int index) {
    switch (index) {
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AmpulePreparePage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VialPreparePage(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NssPreparePage(),
          ),
        );
        break;
      default:
    }
  }
}
