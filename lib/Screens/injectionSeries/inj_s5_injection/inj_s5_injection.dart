import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InjS5 extends StatelessWidget {
  const InjS5({Key key}) : super(key: key);
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
          'การฉีดยา',
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
      body: const InjectionBody(),
    );
  }
}

class InjectionBody extends StatelessWidget {
  const InjectionBody({Key key}) : super(key: key);

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
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n1. ล้างมือให้สะอาด และสวมถุงมือก่อนฉีดยา\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s5/1-1-8.gif",
                        height: 150,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/Inj_s5/1-2.gif",
                        height: 150,
                      ),
                    ),
                  ),
                ],
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '2. เช็ดจุกยางด้วยสำลีชุบแอลกอฮอล์ 70% รอให้แห้ง\n\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/2-6.jpg",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '3. ไล่อากาศออกจากกระบอกฉีดยาที่บรรจุ NSS 0.9% แทงเข็มผ่านจุกยาง ดึงลูกสูบขึ้นเล็กน้อย เมื่อเห็นเลือดไหลย้อนขึ้นมาตามสายให้ฉีด NSS 0.9% เข้าไปประมาณ 3-5 มิลลิลิตรจากนั้นดึงเข็มที่ฉีด NSS 0.9% ออก\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/Inj_s5/3.jpg",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '4. แทงเข็มฉีดยาผ่านจุกยางแล้วฉีดยาที่เตรียมไว้ช้า ๆ ตามแผนการรักษา สอบถามความเจ็บปวดบริเวณที่ฉีดและอาการโดยทั่วไปของผู้ป่วยขณะได้รับยาฉีด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/4.png",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '5. เมื่อฉีดยาหมด เปลี่ยนเป็นฉีด NSS 0.9% อีกครั้งประมาณ 3-5 มิลลิลิตรเสร็จแล้วให้ดันลูกสูบไว้ตลอดเวลาเพื่อคงความดันบวกไว้ในเข็ม ขณะเดียวกันค่อย ๆ ดึงเข็มออกจากจุกยาง\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/5.jpg",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '6. เช็ดจุกยางด้วยสำลีชุบแอลกอฮอล์ 70%\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/2-6.jpg",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '7. ทิ้งกระบอกฉีดยา (ต้องอย่างระมัดระวัง) สำลีใช้แล้ว ถุงมือในถังขยะติดเชื้อ\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/7.jpg",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '8. ล้างมือ\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/1-1-8.gif",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '9. บันทึกการให้ยา ชื่อยา ขนาดยา ทางที่ให้ เวลาที่ให้จริง พร้อมกับเซ็นชื่อให้ยาลงในแผ่นบันทึกการให้ยา ในกรณีที่มีสิ่งผิดปกติต่าง ๆ หรือผู้ป่วยให้ข้อมูลถึงอาการที่เกิดขึ้นจากการฉีดยาให้บันทึกในแผ่นบันทึกการพยาบาล\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/9.png",
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
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '10. ประเมินอาการผู้ป่วยภายหลังการให้ยาเป็นระยะโดยเฉพาะยาที่มีผลข้างเคียงมาก หรือยาที่ต้องมีการติดตามอาการหลังให้ยาอย่างใกล้ชิด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Inj_s5/10.png",
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
          ],
        ),
      ),
    );
  }
}
