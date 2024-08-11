import 'dart:convert';

import 'package:deals_dray/login_screen/login_screen_model/login_screen_model.dart';
import 'package:deals_dray/verify_otp_screen/verify_otp_view/verify_otp_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends ChangeNotifier {
  Data? myData;
  String message = "";
  String myUserId = "";

  getOtp(deviceId, phoneNumber, context) async {
    final url = Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/otp");

    final api = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"mobileNumber": phoneNumber, "deviceId": deviceId}));

    final decodeData = jsonDecode(api.body);
    final otpData = OtpData.fromJson(decodeData);

    if (api.statusCode == 200 &&
        otpData.data.message == "OTP send successfully ") {
      //print("-------------");
      myData = otpData.data;
      message = otpData.data.message;
      myUserId = otpData.data.userId;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(otpData.data.message),
        duration: const Duration(seconds: 2),
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyOtpView(
                    phoneNumber: phoneNumber,
                    deviceId:deviceId,
                    userId:myData!.userId,
                  )));
    } else {
      if (kDebugMode) {
        print("Error ${api.statusCode}");
      }
    }
  }
}
