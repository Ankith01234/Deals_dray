// To parse this JSON data, do
//
//     final otpData = otpDataFromJson(jsonString);

import 'dart:convert';

OtpData otpDataFromJson(String str) => OtpData.fromJson(json.decode(str));

String otpDataToJson(OtpData data) => json.encode(data.toJson());

class OtpData {
  int status;
  Data data;

  OtpData({
    required this.status,
    required this.data,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) => OtpData(
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
  String userId;
  String deviceId;

  Data({
    required this.message,
    required this.userId,
    required this.deviceId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    userId: json["userId"],
    deviceId: json["deviceId"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userId": userId,
    "deviceId": deviceId,
  };
}
