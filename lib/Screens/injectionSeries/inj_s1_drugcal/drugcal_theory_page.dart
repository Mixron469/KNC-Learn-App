// import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class DrugCalTheoryPage extends StatelessWidget {
  const DrugCalTheoryPage({Key key}) : super(key: key);

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
                      text:
                          '          ในคำสั่งการรักษาของแพทย์อาจไม่ได้ระบุขนาดยาที่จะฉีดให้ผู้ป่วยเท่ากับขนาดที่มีบรรจุอยู่ในขวดยา ',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text:
                          'ดังนั้น พยาบาลต้องสามารถคำนวณขนาดยาตามที่แพทย์สั่งได้อย่างถูกต้อง\n',
                      style: normalStyle,
                    ),
                    /*TextSpan(
                      text: '          วิธีการคำนวณยามี ',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: '2 วิธี',
                      style: underlinedBoldStyle,
                    ),
                    TextSpan(
                      text:
                          ' คือ การคำนวณโดยใช้สูตร และการคำนวณโดยเทียบบัญญัติไตรยางศ์ ดังนี้',
                      style: normalStyle,
                    ),*/
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: Image.asset("assets/images/medcal2.png"),
              ),
            ),
            Container(
              height: 16,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '1. สูตร D/X = H \n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'โดย\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text:
                          'D = ขนาดยาที่ต้องการ, \nX = จำนวนยาที่ต้องการฉีด, \nH = ขนาดยาที่บรรจุอยู่ในขวด\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'ตัวอย่าง\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          'ต้องการยาฉีด ชนิด A ขนาด 60 mg ในขวดบรรจุยา 40 mg/ml จะต้องเตรียมยาจำนวนเท่าไร?\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'กำหนด\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          'D = 60 mg, \nX = จำนวนยาที่ต้องการฉีด, \nH = 40 mg/ml\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'แทนค่าสูตร',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 210,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 170, 201, 248),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '60 mg/',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'X',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: ' = 40 mg/ml\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: '60 mg/ 40 mg/ml = ',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'X\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'X = 1.5 ml',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  text: '"ดังนั้น จำนวนยาที่ต้องการ จึงเท่ากับ 1.5 ml"',
                  style: italicStyle,
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '2. เทียบบัญญัติไตรยางศ์ \n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          'จากโจทย์ข้างต้น ยา 40 mg ต้องเตรียมยา จำนวน 1 ml\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: 'ยา 60 mg ต้องเตรียมยา จำนวน\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 210,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 170, 201, 248),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '1 ml/ 40 mg x 60 mg\n',
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: '          = 1.5 ml',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  text: '"ดังนั้น จำนวนยาที่ต้องการ จึงเท่ากับ 1.5 ml เช่นกัน"',
                  style: italicStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
