import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class VialPreparePage extends StatelessWidget {
  const VialPreparePage({Key key}) : super(key: key);

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
          'วิธีปฏิบัติการเตรียมยาชนิดผงจากขวด (Vial)',
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
      body: const VialPrepareBody(),
    );
  }
}

class VialPrepareBody extends StatelessWidget {
  const VialPrepareBody({Key key}) : super(key: key);

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
                  "assets/images/Inj_s4/Prepare_Vial/vial1.jpg",
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
                          '2. หยิบขวดยา อ่านชื่อยา เปิดฝาจุกขวดยา เช็ดด้วยสำลีแอลกอฮอล์ 70% วนจากด้านในออก ด้านนอก\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial2-9.png",
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
                          '3. หยิบหลอดน้ำกลั่นปราศจากเชื้อ ตรวจสอบชื่อ เช็ดคอคอดของหลอดน้ำกลั่นปราศจากเชื้อด้วยสำลีแอลกอฮอล์70%\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial3.png",
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
                      text: '4. หักปลายหลอดน้ำกลั่นปราศจากเชื้อ\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial4.jpg",
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
                          '5. เปิดซอง Syringe และซองเข็มฉีดยา ต่อ Syringe เข้ากับเข็มฉีด หมุนเข็มฉีดยาให้แน่นก่อนใช้ โดยให้ปลายปาดของเข็มอยู่ด้านเดียวกับมาตรบอกปริมาณของ Syringe ถอดปลอดเข็ม\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial5.jpg",
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
                          '6. จับหลอดน้ำกลั่นปราศจากเชื้อขึ้นด้วยมือที่ไม่ถนัด สอดปลายเข็มเข้าไปในลักษณะคว่ำลง ดูดน้ำกลั่นปราศจากเชื้อตามจำนวนที่ต้องการ\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '\n7. จับขวดยาด้วยมือที่ไม่ถนัด อ่านชื่อยา แทงเข็มเข้าบริเวณกลางจุกยาง แล้วดันน้ำเข้าจนหมด ให้ปลายเข็มอยู่ในอากาศ ปล่อยให้แกนในกระบอกสูบดันถอยออกมาจนหยุดจึงดึงเข็มออก\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial6-7.png",
                  height: 250,
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
                      text: '8. เขย่ายาจนละลายหมด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial8.png",
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
                      text: '9. เช็ดจุกยางด้วยสำลีแอลกอฮอล์ 70% รอให้แห้ง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial2-9.png",
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
                          '10. ดึงแกนใน Syringe ออกมาเท่าปริมาณน้ำยาที่จะดูดออกจากขวด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial10.png",
                  height: 250,
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
                          '11. มือข้างที่ไม่ถนัดจับขวดยา ส่วนมือข้างที่ถนัดจับ Syringe แทงเข็มเข้าไปที่จุกยางตรงกลางให้ต่างกับตำแหน่งกับที่แทงเข้าในครั้งแรก ดันแกนใน Syringe เข้าไปในขวด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '\n12. คว่ำขวดยา ให้ปลายเข็มอยู่ใต้น้ำยา ปล่อยให้แกนใน Syringe เลื่อนออกมา ยาจากขวดจะไหลเข้าไปใน Syringe หากยาในขวดยังออกมาไม่เท่ากับจำนวนที่ต้องการให้ใช้นิ้วหัวแม่มือและนิ้วชี้มือข้างที่ถนัดดึงแกน Syringe ลง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial11-12.png",
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
                          '13. ดึงเข็มออกจากขวดยา ถอยแกนใน Syringe เล็กน้อย\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '14. เปลี่ยนเข็มเป็นเข็มฉีดยาตามขนาดที่เหมาะสม\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial13-14.jpg",
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
                          '15. วาง Syringe ฉีดยาลงใน Tray Sterile โดยระมัดระวังให้ Syringe และเข็มฉีดยาอยู่ในสภาพสะอาด ปราศจากเชื้อ และปิดฝาให้มิดชิด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial15.jpg",
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
                          '16. ตรวจสอบชื่อยา ขนาดยาที่หลอดยากับคำสั่งการรักษาอีกครั้งก่อนทิ้งหลอดยา และวางบันทึกการให้ยาคู่กับภาชนะใส่กระบอกฉีดยา\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial16.jpg",
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
                      text: '17. ล้างมือให้สะอาด เช็ดให้แห้ง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s4/Prepare_Vial/vial17.png",
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
