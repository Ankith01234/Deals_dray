import 'dart:convert';


import 'package:deals_dray/home_screen/bottom_navigation/bottom_navigation.dart';
import 'package:deals_dray/verify_otp_screen/verify_otp_model/verify_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyOtpController extends ChangeNotifier {
  Data? myData;
  String message = "";

  verifyOtp(otp, deviceId, userId, context) async {
    final url =
        Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/otp/verification");

    final api = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"otp": otp, "deviceId": deviceId, "userId": userId}));

    final decodeData = jsonDecode(api.body);
    final verificationData = VerifyOtpData.fromJson(decodeData);

    message = verificationData.data!.message;
    //print(message);

    if (api.statusCode == 200 && verificationData.data.message == "Successfully verified mobile number")
    {
      myData = verificationData.data;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigation()));
    }
    else if(message!="Invalid OTP")
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
