import 'package:deals_dray/common_widget/common_widget.dart';
import 'package:deals_dray/riverpod/riverpod.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:deals_dray/resources/resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../registration_page/registration_page_view/registration_page_view.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  int _selectedIndex = 0;
  CommonWidget commonWidget = CommonWidget();
  TextEditingController phoneNumberController = TextEditingController();
  String deviceId = "66863a325120b12d7e181fdf";

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ref.read(deviceIdProvider).getDeviceId();
  // }

  @override
  Widget build(BuildContext context) {
    //final deviceListener=ref.watch(deviceIdProvider);
    final loginListener = ref.watch(otpProvider);
    return Scaffold(
      backgroundColor: Color.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 35,
            ),
            Center(child: Image.asset("Images/dealsdray.jpeg")),
            ToggleButtons(
              borderRadius: BorderRadius.circular(40.0),
              selectedBorderColor: Color.redColor,
              selectedColor: Color.whiteColor,
              fillColor: Color.redColor,
              color: Color.darkColor,
              constraints:
                  const BoxConstraints(minHeight: 60.0, minWidth: 100.0),
              isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              onPressed: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: const [
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 35),
                      child: Text(
                        "Glad to see you!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Please provide your phone number",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            commonWidget.myTextField(phoneNumberController, "phone"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    loginListener.getOtp(
                        deviceId, phoneNumberController.text, context);
                    phoneNumberController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.redColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    "SEND CODE",
                    style: TextStyle(color: Color.whiteColor, fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "Click Here to ",
                  style: TextStyle(color: Color.darkColor, fontSize: 18)),
              TextSpan(
                  text: "Register",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationPageView()));
                    },
                  style: const TextStyle(
                      color: Color.redColor,
                      decoration: TextDecoration.underline,
                      fontSize: 18)),
            ])),
          ],
        ),
      ),
    );
  }
}
