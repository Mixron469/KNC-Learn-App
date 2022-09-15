// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeedleListPage extends StatelessWidget {
  const NeedleListPage({Key key}) : super(key: key);

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
          'ตัวอย่างเข็มปลอดเชื้อ',
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
      body: const NeedleListBody(),
    );
  }
}

class NeedleListBody extends StatelessWidget {
  const NeedleListBody({Key key}) : super(key: key);

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
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2-1.jpg",
                  height: 100,
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
                      text: '\n1. ขนาดเบอร์ 18 ความยาว 1 นิ้ว',
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
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2-2.jpg",
                  height: 100,
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
                      text: '\n2. ขนาดเบอร์ 18 ความยาว 1½ นิ้ว',
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
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2-3.jpg",
                  height: 100,
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
                      text: '\n3. ขนาดเบอร์ 20 ความยาว 1 นิ้ว',
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
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2-4.jpg",
                  height: 100,
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
                      text: '\n4. ขนาดเบอร์ 20 ความยาว 1½ นิ้ว',
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
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2-5.jpg",
                  height: 100,
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
                      text: '\n5. ขนาดเบอร์ 23 ความยาว 1 นิ้ว',
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
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2-6.jpg",
                  height: 100,
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
                      text: '\n6. ขนาดเบอร์ 24 ความยาว 1 นิ้ว',
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
