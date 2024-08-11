// To parse this JSON data, do
//
//     final verifyOtpData = verifyOtpDataFromJson(jsonString);

import 'dart:convert';

VerifyOtpData verifyOtpDataFromJson(String str) => VerifyOtpData.fromJson(json.decode(str));

String verifyOtpDataToJson(VerifyOtpData data) => json.encode(data.toJson());

class VerifyOtpData {
  int status;
  Data data;

  VerifyOtpData({
    required this.status,
    required this.data,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) => VerifyOtpData(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String message;

  Data({
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
