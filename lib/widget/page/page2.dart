// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);
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
          'Favourites',
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
    );
  }
}
