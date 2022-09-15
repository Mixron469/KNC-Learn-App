// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class NssPreparePage extends StatelessWidget {
  const NssPreparePage({Key key}) : super(key: key);

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
          'วิธีปฏิบัติการเตรียม NSS 0.9%',
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
      body: const NssPrepareBody(),
    );
  }
}

class NssPrepareBody extends StatelessWidget {
  const NssPrepareBody({Key key}) : super(key: key);

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
                  "assets/images/Inj_s4/Prepare_Nss/nss1.jpg",
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
                          '2. หยิบขวด NSS 0.9 % ทำความสะอาดส่วนคอดของขวด NSS 0.9 % ด้วยสำลีแอลกอฮอล์ 70%\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss2.png",
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
                      text: '3. เปิดซอง Syringe และซองเข็มฉีดยา\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss3.jpg",
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
                          '4. ดึงแกนใน Syringe ออกมาเท่าปริมาณที่จะดูดออกจากขวด NSS 0.9 % มือข้างที่ไม่ถนัดจับขวด NSS 0.9 % ส่วนมือข้างที่ถนัดจับ Syringe\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss4.png",
                  height: 200,
                ),
              ),
            ),
            /*Container(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              height: 34,
              color: Color.fromARGB(255, 195, 215, 245),
              indent: 16,
              endIndent: 16,
            ),*/
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '\n5. ต่อ Syringe เข้ากับขวด NSS 0.9 %  ดันแกนใน Syringe เข้าไปในขวด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss5.png",
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
                          '6. คว่ำขวด NSS 0.9 % ปล่อยให้แกนใน Syringe เลื่อนออกมา NSS 0.9 % จากขวดจะไหลเข้าไปใน Syringe ในปริมาณ 3-5 มิลลิลิตร หาก NSS 0.9 % ในขวดยังออกมาไม่เท่ากับจำนวนที่ต้องการให้ใช้นิ้วหัวแม่มือและนิ้วชี้มือข้างที่ถนัดดึงแกน Syringe ลง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss6.png",
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
                          '7. ต่อ syringe เข้ากับเข็มฉีดยา หมุนเข็มฉีดยาให้แน่นก่อนใช้ โดยให้ปลายปาดของเข็มอยู่ด้านเดียวกับมาตรบอกปริมาณของ Syringe\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss7.jpg",
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
                          '8. วาง Syringe ฉีดยาลงใน Tray Sterile โดยระมัดระวังให้ Syringe และเข็มฉีดยาอยู่ในสภาพสะอาด ปราศจากเชื้อ และปิดฝาให้มิดชิด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Nss/nss8.jpg",
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
