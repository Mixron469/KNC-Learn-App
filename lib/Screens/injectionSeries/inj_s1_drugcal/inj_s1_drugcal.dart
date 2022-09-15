import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator_page.dart';
import 'drugcal_theory_page.dart';

class InjS1 extends StatelessWidget {
  const InjS1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await SystemSound.play(SystemSoundType.click).then(
          (value) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        );
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
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
              'การคำนวนยา',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 131, 177, 247),
                  fontSize: 18,
                  fontFamily: 'SukhumvitSet'),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              onTap: (value) async {
                await SystemSound.play(SystemSoundType.click).then(
                  (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                );
              },
              padding: const EdgeInsets.all(8),
              indicator: ShapeDecoration(
                  color: const Color.fromARGB(255, 170, 201, 248),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              // indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w300),
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  child: Text(
                    "Theory",
                    style: TextStyle(
                      fontFamily: "SukhumvitSet",
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Drug Calculator",
                    style: TextStyle(
                      fontFamily: "SukhumvitSet",
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(8),
            child: const TabBarView(
              children: [
                DrugCalTheoryPage(),
                CalculatorPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
