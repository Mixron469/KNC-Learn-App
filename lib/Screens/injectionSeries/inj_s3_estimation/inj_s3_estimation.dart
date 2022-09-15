import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InjS3 extends StatelessWidget {
  const InjS3({Key key}) : super(key: key);
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
          'การประเมินก่อนฉีดยา',
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
      body: const EstimationPage(),
    );
  }
}

class EstimationPage extends StatelessWidget {
  const EstimationPage({Key key}) : super(key: key);

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
                      text: '\n\nให้ทำการประเมิน ดังนี้\n\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text:
                          '1. ตรวจสอบบันทึกการให้ยาหรือคำสั่งการรักษาของแพทย์',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation1.png",
                width: 200,
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
                      text: '2. สอบถามประวัติการแพ้ยาของผู้ป่วย\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation2.png",
                width: 200,
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
                          '3. ตรวจสอบความถูกต้องชื่อ-สกุลผู้ป่วย ชนิดของยา ขนาดยา วิถีการให้ยา เวลาที่ให้และวันหมดอายุของยาที่จะให้ผู้ป่วย\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation3.png",
                width: 200,
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
                          '4. ประเมินบริเวณที่จะให้ยา มีลักษณะบวม แดง มีการอักเสบของหลอดเลือดดำหรือไม่ เนื่องจากลักษณะดังกล่าวมีผลต่อการดูดซึมของยา ทำให้ผู้ป่วยไม่สุขสบาย เกิดภาวะแทรกซ้อนหรืออาการข้างเคียงจากการให้ยาได้\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation4.png",
                width: 200,
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
                          '5. ประเมินความรู้เกี่ยวกับการได้รับยาของผู้ป่วย เพื่อวางแผนให้สุขศึกษาเกี่ยวกับวัตถุประสงค์และอาการข้างเคียงของยาแก่ผู้ป่วย\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation5.png",
                width: 200,
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
                          '6. กรณีที่ยามีผลต่อสัญญาณชีพ ประเมินสัญญาณชีพของผู้ป่วยก่อนและหลังให้ยา\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation6.png",
                width: 200,
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
                          '7. กรณีที่ให้ยาแก้ปวด ประเมินความปวดของผู้ป่วยก่อนและหลังการให้ยา ตามแนวทางการประเมินความปวด\n',
                      style: normalStyle,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Inj_s3/estimation7.jpg",
                width: 200,
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
