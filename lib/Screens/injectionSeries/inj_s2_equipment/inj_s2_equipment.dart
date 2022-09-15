import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s2_equipment/needle_list.dart';
import 'package:knc_learn_app/Screens/injectionSeries/inj_s2_equipment/syringe_list.dart';

class InjS2 extends StatelessWidget {
  const InjS2({Key key}) : super(key: key);

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
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 131, 177, 247),
        ),
        centerTitle: true,
        title: const Text(
          'อุปกรณ์ฉีดยา',
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
      body: const EquipmentPage(),
    );
  }
}

class EquipmentPage extends StatelessWidget {
  const EquipmentPage({Key key}) : super(key: key);

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
              child: Image.asset(
                "assets/images/medicine.gif",
                width: 200,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '          อุปกรณ์ที่ใช้ในการฉีดยา ประกอบด้วย ',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'ขนาดของหัวเข็ม ',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'และ ',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'ขนาดของกระบอกฉีดยา ',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          'ที่แตกต่างกันตามช่องทางที่ฉีดยา อายุผู้ป่วย และปริมาณยา \n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'อุปกรณ์ที่ใช้ในการฉีดยามีดังนี้\n',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/1-1.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/1-2.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/1-3.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '1. ยาฉีดที่จะให้ตามแผนการรักษา\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: '"ยาที่บรรจุอยู่ใน Ampule หรือ Vial"\n',
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
            Center(
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/2.png",
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
                      text: '2. เข็มปลอดเชื้อ (Disposable needle)\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text:
                          '"ขนาดเบอร์ 23-24 สำหรับฉีดยา และขนาดเบอร์ 18-20 สำหรับผสมยา และ/หรือดูดยา ความยาวเข็มที่ใช้ 1 นิ้ว "',
                      style: italicStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: ElevatedButton(
                // style: loginButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 131, 177, 247),
                  fixedSize: const Size(340, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () async {
                  await SystemSound.play(SystemSoundType.click).then(
                    (value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NeedleListPage(),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "ดูรูปเพิ่มเติมของตัวอย่างเข็มปลอดเชื้อขนาดต่าง ๆ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SukhumvitSet',
                    color: Colors.white,
                  ),
                ),
              ),
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
                  "assets/images/Inj_s2/3.jpg",
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
                      text: '3. กระบอกฉีดยาปลอดเชื้อ (Disposable Syringe)\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: '"ขนาดเหมาะสมกับจำนวนยาที่ต้องการ"\n',
                      style: italicStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: ElevatedButton(
                // style: loginButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 131, 177, 247),
                  fixedSize: const Size(340, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () async {
                  await SystemSound.play(SystemSoundType.click).then(
                    (value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SyringeListPage(),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "ดูรูปเพิ่มเติมของตัวอย่างกระบอกฉีดยา\nปลอดเชื้อขนาดต่าง ๆ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SukhumvitSet',
                    color: Colors.white,
                  ),
                ),
              ),
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
                  "assets/images/Inj_s2/4.png",
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
                      text: '4. NSS 5 ml\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text:
                          '"สำหรับ flush หลอดเลือดดำ\nเพื่อป้องกันการเกิดลิ่มเลือดอุดตัน"\n',
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
            Center(
              child: SizedBox(
                width: 350,
                child: Image.asset(
                  "assets/images/Inj_s2/5.png",
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
                      text: '5. น้ำกลั่น (sterile water for injection)\n',
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
                  "assets/images/Inj_s2/6.jpg",
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
                      text: '6. สำลีแอลกอฮอล์ 70%\n',
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
                  "assets/images/Inj_s2/7.jpg",
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
                      text: '7. Tray sterile พร้อมฝาปิด\n',
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
                  "assets/images/Inj_s2/8.jpg",
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
                      text: '8. ใบเลื่อยสำหรับตัดแอมป์ยา\n',
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
                  "assets/images/Inj_s2/9.jpg",
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
                      text: '9. ถุงมือสะอาด\n',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/10-1.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/10-2.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '10. กล่องทิ้งเข็ม\n',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/11-1.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/11-2.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '11. ชามรูปไต\nหรือถังขยะขนาดเล็กสำหรับใส่ของที่ใช้แล้ว\n',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/12-1.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s2/12-2.jpg",
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '12. ถาดใส่เครื่องใช้หรือรถเข็น\n',
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
