import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AmpulePreparePage extends StatelessWidget {
  const AmpulePreparePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            await SystemSound.play(SystemSoundType.click).then(
              (value) {
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
          'การเตรียมยาจากหลอดยา (Ampule)',
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
      body: const AmpulePrepareBody(),
    );
  }
}

class AmpulePrepareBody extends StatelessWidget {
  const AmpulePrepareBody({Key key}) : super(key: key);

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
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. เตรียมอุปกรณ์วางในถาดสะอาด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule1.jpg",
                  height: 150,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '2. หยิบหลอดยา ถ้ามียาอยู่ที่ปลายหลอด ให้เคาะหรือใช้นิ้วดีดให้ยาผ่านส่วนคอดของหลอดยาไหลลงมาข้างล่าง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule2.gif",
                  height: 200,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '3. ทำความสะอาดส่วนคอดของหลอดยา ด้วยสำลีแอลกอฮอล์ 70%\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule3.png",
                  height: 200,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '4. หลอดยามี 3 แบบ คือ\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule4.png",
                  height: 200,
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
                      text: '\na. แบบที่มีวงแหวนสีคาดคอ\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          '"เป็นแบบที่หักปลายหลอดยาได้โดยไม่ต้องเลื่อย ใช้สำลีหรือผ้าก๊อซปราศจากเชื้อหุ้มคอคอดของหลอดยา และหักหลอดยาบริเวณรอยวงแหวนสี"\n\n',
                      style: italicStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule5.png",
                  height: 200,
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
                      text: '\nb. แบบที่มีจุดตำแหน่งสำหรับหักหลอด\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'โดยการหักหลอดแบ่งเป็น 2 แบบ ดังนี้\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule5-1.png",
                  height: 200,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'การหักหลอดยาโดยการหักออกนอกตัว\n(Snap back method)\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text:
                          '"ให้หันจุดบนคอคอดเข้าหาตัว ใช้นิ้วหัวแม่มืออยู่ตรงกับจุดสี ใช้แรงกดส่วนบนของหลอดไปด้านหลัง"\n',
                      style: italicStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule5-2.png",
                  height: 200,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'การหักหลอดยาโดยการหักเข้าหาตัว\n(Snap forward method)\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text:
                          '"โดยใช้นิ้วหัวแม่มืออยู่ตรงข้ามกับจุดสีใช้แรงกดส่วนบนของหลอด หักเข้าหาตัว"\n\n',
                      style: italicStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule6.png",
                  height: 200,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '\nc. หลอดยาที่ต้องใช้ใบเลื่อยจะไม่มีแถบสีที่คอคอดของหลอดยา\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          '"ให้เลื่อยบริเวณคอหลอดยาก่อนจึงจะหัก ปลายหลอดได้ ให้เช็ดใบเลื่อย ด้วยสำลีแอลกอฮอล์ 70% ก่อนเลื่อยคอหลอดยา เมื่อเลื่อยแล้วจึงหักปลายหลอดยา"',
                      style: italicStyle,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '5. เปิดซอง Syringe และซองเข็มฉีดยา ต่อ Syringe เข้ากับเข็มฉีด หมุนเข็มฉีดยาให้แน่นก่อนใช้ โดยให้ปลายปาดของเข็มอยู่ด้านเดียวกับมาตรบอกปริมาณของ Syringe ถอดปลอกเข็ม',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule7.jpg",
                  height: 150,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '6. จับหลอดยาด้วยมือที่ไม่ถนัด และใช้มือข้างที่ถนัดจับ Syringe ฉีดยาโดยคว่ำปลายเข็มลงสอดปลายเข็มเข้าไปในหลอดยา ให้ปลายเข็มอยู่ในน้ำยา\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule8.png",
                  height: 150,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '7. ดูดยาให้ได้ตามจำนวนที่ต้องการ โดยการถอยแกนใน Syringe ออกจนครบตามจำนวนที่ต้องการ\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule9.png",
                  height: 200,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '8. เปลี่ยนเข็มเป็นเข็มฉีดยาตามขนาดที่เหมาะสม\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule10.jpg",
                  height: 200,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '9. วาง Syringe ฉีดยาลงใน Tray Sterile โดยระมัดระวังให้ Syringe และเข็มฉีดยาอยู่ในสภาพสะอาด ปราศจากเชื้อ และปิดฝาให้มิดชิด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule11.jpg",
                  height: 100,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '10. ตรวจสอบชื่อยา ขนาดยาที่หลอดยากับคำสั่งการรักษา อีกครั้งก่อนทิ้งหลอดยา และวางบันทึกการให้ยาคู่กับภาชนะใส่กระบอกฉีดยา\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule12.jpg",
                  height: 200,
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
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '11. ล้างมือให้สะอาด เช็ดให้แห้ง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Ampule/ampule13.png",
                  height: 200,
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
