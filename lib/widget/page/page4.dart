// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page4 extends StatelessWidget {
  const Page4({Key key}) : super(key: key);
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
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 131, 177, 247),
        ),
        centerTitle: true,
        title: const Text(
          'Creator List',
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
      body: const CreatorListBody(),
    );
  }
}

class CreatorListBody extends StatelessWidget {
  const CreatorListBody({Key key}) : super(key: key);

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
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/creator/1.jpg'),
                    ),
                  ),
                  Container(height: 16),
                  const Text(
                    'อาจารย์ ดร.สมจิตต์  เวียงเพิ่ม',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SukhumvitSet',
                    ),
                  ),
                  const Text(
                    'อาจารย์ที่ปรึกษาวิจัย',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SukhumvitSet',
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 24),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/2.jpg'),
                  ),
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาวเกสรา ราชประโคน\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาวจารุภา น้ำนิล\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/3.jpg'),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            Container(height: 24),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/4.jpg'),
                  ),
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาวฐิตาภา เร่งพิมาย\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาววรรณวดี แส่สันเทียะ\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/5.jpg'),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            Container(height: 24),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/6.jpg'),
                  ),
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาววรินทิพย์ นกพันธุ์\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาวสุดารัตน์ เข็มแก้ว\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/7.jpg'),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            Container(height: 24),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/8.jpg'),
                  ),
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นางสาวสุปรีญา บุญประดิษฐ์\n',
                                style: boldStyle),
                            TextSpan(text: 'นักศึกษาวิจัย', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 16),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'นายภราดร รักษาแก้ว\n', style: boldStyle),
                            TextSpan(text: 'ผู้พัฒนาแอพ', style: normalStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/creator/9.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
