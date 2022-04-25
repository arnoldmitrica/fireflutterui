import 'package:fireflutterui/fireflutterui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'FireflutterUI Catalog'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final TextEditingController phoneNumberOrEmailController =
      TextEditingController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("disposed");
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(children: [
              SizedBox(
                height: 69,
                child: FFPhoneNumberOrEmailTextField(
                    myprovider: catalogProvider,
                    hintText: "This is a hint text for phone-email textfield",
                    controller: widget.phoneNumberOrEmailController),
              ),
              const SizedBox(
                height: 8,
              ),
              FFTextButton(
                  buttonText: "This is the button text", onPressed: () => {}),
              const SizedBox(
                height: 8,
              ),
              Text(
                "This is the FF title",
                style: FireFlutterTextStyles.poppinsSize28Weight700Black,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "This is the FF subtitle",
                style:
                    FireFlutterTextStyles.poppinsSize16Weight400BlackOpacity60,
              ),
              const SizedBox(
                height: 8,
              ),
              PlainTexts.registerPageTerms,
              const SizedBox(
                height: 8,
              ),
              Pinput(
                obscureText: true,
                defaultPinTheme: FireFlutterTextFields.ffPinTheme,
                length: 6,
              ),
              const SizedBox(
                height: 8,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
