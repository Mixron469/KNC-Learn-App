// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);
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
          'References',
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
      body: const ReferencesPage(),
    );
  }
}

class ReferencesPage extends StatelessWidget {
  const ReferencesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String urlString1 =
        'http://courseware.npru.ac.th/admin/files/20170115134640_5c4f76fc95a0fd5f085706f931e74c5e.pdf';
    final Uri url1 = Uri.parse(urlString1);
    const String urlString2 = 'https://www.nurse.kku.ac.th';
    final Uri url2 = Uri.parse(urlString1);
    const TextStyle normalStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: 'SukhumvitSet',
      color: Colors.black87,
    );
    const TextStyle italicStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'SukhumvitSet',
      color: Colors.black54,
      fontStyle: FontStyle.italic,
    );
    const TextStyle underlinedStyle = TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 14,
      fontFamily: 'SukhumvitSet',
      color: Colors.blueAccent,
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              height: 16,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '?????????????????? ???????????????????????????. (2559). ',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????????????????????????????? ?????????????????????????????????????????????????????? ??????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????? ???????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????????????????????????????????????? ??? ?????????????????????????????????????????????????????????????????? ?????????????????????????????????????????? : ??????????????? 11 ?????????????????????????????????. ',
                          style: italicStyle,
                        ),
                        TextSpan(
                          text: '????????????????????????????????? 15 ?????????????????? 2565. ????????? ',
                          style: normalStyle,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    /*onTap: () async {
                      if (await canLaunchUrl(url1)) {
                        await launchUrl(url1);
                      } else {
                        Fluttertoast.showToast(msg: "Could not launch Link");
                        throw 'Could not launch $url1';
                      }
                    },*/
                    child: const Text(
                      urlString1,
                      style: underlinedStyle,
                    ),
                  ),
                ],
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
                      text: '??????????????????????????????????????????????????????. (2562). ',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '?????????????????????????????????????????????????????????????????????????????? (Administering intravenous injection). ',
                          style: italicStyle,
                        ),
                        TextSpan(
                          text: '????????????????????????????????? 15 ?????????????????? 2565. ????????? ',
                          style: normalStyle,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    /*onTap: () async {
                      if (!await canLaunchUrl(url2)) {
                        Fluttertoast.showToast(msg: "Could not launch Link");
                        throw 'Could not launch $url2';
                      } else {
                        await launchUrl(url2);
                      }
                    },*/
                    child: const Text(
                      urlString2,
                      style: underlinedStyle,
                    ),
                  ),
                ],
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
                      text: '?????????????????? ??????????????????????????? ??????????????????????????? ??????????????????????????????. (2564). ',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '???????????????????????????????????????????????? (???????????????????????????????????????????????? 2). ',
                          style: italicStyle,
                        ),
                        TextSpan(
                          text: '?????????????????????????????? ????????????????????????????????? : ????????????????????????',
                          style: normalStyle,
                        ),
                      ],
                    ),
                  ),
                ],
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
                      text:
                          '???????????????????????? ??????????????????????????????, ?????????????????? ???????????????????????? ?????????????????????????????? ???????????????????????????????????????. (2559). ',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '????????????????????????????????????????????????????????????????????? II. ',
                          style: italicStyle,
                        ),
                        TextSpan(
                          text: '??????????????????????????????????????????????????? : ????????????????????????',
                          style: normalStyle,
                        ),
                      ],
                    ),
                  ),
                ],
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
                      text: '?????????????????? ?????????????????????. (2555). ',
                      style: boldStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '???????????????????????????????????????????????? : ????????????????????????????????????????????????. ',
                          style: italicStyle,
                        ),
                        TextSpan(
                          text: '??????????????????????????????????????????????????????????????? : ????????????????????????',
                          style: normalStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
