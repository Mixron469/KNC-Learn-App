// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SyringeListPage extends StatelessWidget {
  const SyringeListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                await SystemSound.play(SystemSoundType.click).then(
                  (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                );
              },
              child: const Icon(
                Icons.home_rounded,
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 131, 177, 247),
        ),
        centerTitle: true,
        title: const Text(
          'ตัวอย่างกระบอกฉีดยาปลอดเชื้อ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 131, 177, 247),
              fontSize: 16,
              fontFamily: 'SukhumvitSet'),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SyringeListBody(),
    );
  }
}

class SyringeListBody extends StatelessWidget {
  const SyringeListBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle normalStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle italicStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black54,
      fontStyle: FontStyle.italic,
    );
    const TextStyle underlinedBoldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      fontSize: 16,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/Inj_s2/3-1.jpg",
                  height: 250,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. กระบอกฉีดยา ขนาด 3ml.',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              height: 34,
              color: Color.fromARGB(255, 195, 215, 245),
              indent: 16,
              endIndent: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/Inj_s2/3-2.jpg",
                  height: 250,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. กระบอกฉีดยา ขนาด 5ml.',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              height: 34,
              color: Color.fromARGB(255, 195, 215, 245),
              indent: 16,
              endIndent: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/Inj_s2/3-3.jpg",
                  height: 250,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. กระบอกฉีดยา ขนาด 10ml.',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              height: 34,
              color: Color.fromARGB(255, 195, 215, 245),
              indent: 16,
              endIndent: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/Inj_s2/3-4.jpg",
                  height: 250,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. กระบอกฉีดยา ขนาด 20ml.',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              height: 34,
              color: Color.fromARGB(255, 195, 215, 245),
              indent: 16,
              endIndent: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/Inj_s2/3-5.jpg",
                  height: 250,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. กระบอกฉีดยา ขนาด 50ml.',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              height: 34,
              color: Color.fromARGB(255, 195, 215, 245),
              indent: 16,
              endIndent: 16,
            ),
          ],
        ),
      ),
    );
  }
}
