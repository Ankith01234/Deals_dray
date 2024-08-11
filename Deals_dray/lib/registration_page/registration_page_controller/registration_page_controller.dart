import 'dart:convert';

import 'package:deals_dray/login_screen/login_screen_controller/login_screen_controller.dart';
import 'package:deals_dray/login_screen/login_screen_view/login_screen_view.dart';
import 'package:deals_dray/registration_page/registration_page_model/registration_page_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPageController extends ChangeNotifier {
  String message = "";
  Data? myData;

  registerData(email, password, context) async {
    final url =
        Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/email/referral");

    final api = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "userId": "66b749fdbea35e3103eb78a4"
        }));

    final decodeData = jsonDecode(api.body);
    final registerData = RegistrationData.fromJson(decodeData);

    message = registerData.data!.message;

    if (api.statusCode == 200 && message == "Successfully Added")
    {
      myData = registerData.data;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
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
