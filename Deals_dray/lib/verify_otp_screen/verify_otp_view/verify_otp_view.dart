import 'package:deals_dray/common_widget/common_widget.dart';
import 'package:deals_dray/login_screen/login_screen_controller/login_screen_controller.dart';
import 'package:deals_dray/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:deals_dray/resources/resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyOtpView extends ConsumerStatefulWidget {
  const VerifyOtpView(
      {super.key,
      required this.phoneNumber,
      required this.deviceId,
      required this.userId});

  final String phoneNumber;
  final String deviceId;
  final String userId;

  @override
  VerifyOtpViewState createState() => VerifyOtpViewState();
}

class VerifyOtpViewState extends ConsumerState<VerifyOtpView> {
  CommonWidget commonWidget = CommonWidget();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController = LoginScreenController();
    final otpVerifyListener = ref.watch(otpVerifyProvider);
    return Scaffold(
      backgroundColor: Color.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250, top: 100),
              child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset("Images/otpverify.png")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // const SizedBox(
                    //   height: 100,
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(right: 78),
                      child: Text(
                        "OTP Verification",
                        style: TextStyle(
                            color: Color.darkColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "We have sent a unique OTP number",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "to your mobile phone ${widget.phoneNumber}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            commonWidget.myTextField(otpController, "Enter you OTP"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      otpVerifyListener.verifyOtp(otpController.text,
                          widget.deviceId, widget.userId, context);
                      otpController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.redColor),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Color.whiteColor, fontSize: 18),
                    )),
                GestureDetector(
                    onTap: () {
                      loginScreenController.getOtp(
                          widget.deviceId, widget.phoneNumber, context);
                    },
                    child: const Text(
                      "Send Again",
                      style: TextStyle(
                          color: Color.greyColor,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
