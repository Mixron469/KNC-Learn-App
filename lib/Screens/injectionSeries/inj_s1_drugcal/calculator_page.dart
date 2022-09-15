import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>(); // form key
  final TextEditingController dController =
      TextEditingController(); // editing controller
  final TextEditingController hController =
      TextEditingController(); // editing controller
  String xString;
  double dValue;
  double hValue;
  double xValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dField = TextFormField(
      controller: dController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter D First");
        }
        if (!RegExp("^[0-9.]").hasMatch(value)) {
          return ("Please Enter only number");
        }
        return null;
      },
      onSaved: (value) {
        dController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        suffixText: "  mg.",
        suffixStyle: TextStyle(
          fontSize: 16,
          color: Colors.black45,
          fontFamily: 'SukhumvitSet',
          fontStyle: FontStyle.italic,
        ),
        // labelText: "D value",
      ),
      style: const TextStyle(
        fontFamily: 'SukhumvitSet',
        fontSize: 20,
        color: Color.fromARGB(255, 22, 75, 136),
      ),
    );

    final hField = TextFormField(
      controller: hController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter H First");
        }
        if (!RegExp("^[0-9.]").hasMatch(value)) {
          return ("Please Enter only number");
        }
        return null;
      },
      onSaved: (value) {
        hController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        fontFamily: 'SukhumvitSet',
        fontSize: 20,
        color: Color.fromARGB(255, 22, 75, 136),
      ),
      decoration: const InputDecoration(
        suffixText: "  mg./ml.",
        suffixStyle: TextStyle(
          fontSize: 16,
          color: Colors.black45,
          fontFamily: 'SukhumvitSet',
          fontStyle: FontStyle.italic,
        ),
        // labelText: "H value",
      ),
    );

    return SizedBox.expand(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.01),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "IV Drug Calculator",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 170, 201, 248),
                      fontSize: 28,
                      fontFamily: 'SukhumvitSet'),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color.fromARGB(255, 97, 133, 187),
                      fontFamily: 'SukhumvitSet',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "D value ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "(ขนาดของยาที่ต้องการ); (mg.)",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: dField,
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color.fromARGB(255, 97, 133, 187),
                      fontFamily: 'SukhumvitSet',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "H value ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "(ขนาดของยาที่บรรจุในขวด); (mg./ml.)",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: hField,
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  // style: loginButton,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 105, 240, 217),
                    fixedSize: const Size(140, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    await SystemSound.play(SystemSoundType.click).then((value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        setState(() {
                          dValue = double.parse(dController.text);
                          hValue = double.parse(hController.text);
                          xValue = dValue / hValue;
                          xString = xValue.toStringAsFixed(2);
                        });
                      }
                    });
                    // await Calculation(dController.text, hController.text);
                  },
                  child: const Text(
                    "Calculate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SukhumvitSet',
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: const EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 170, 201, 248),
                    border: Border.all(
                      width: 2,
                      color: Colors.blueAccent,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  // color: Colors.black26,
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "The value of X is:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SukhumvitSet',
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '"จำนวนยาที่ต้องการฉีด เท่ากับ"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'SukhumvitSet',
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: xValue != null
                            ? Text(
                                "X = $xString ml.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SukhumvitSet',
                                  color: Colors.blueAccent,
                                ),
                              )
                            : const Text(
                                "X = ... ml.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SukhumvitSet',
                                  color: Colors.blueAccent,
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
