// To parse this JSON data, do
//
//     final registrationData = registrationDataFromJson(jsonString);

import 'dart:convert';

RegistrationData registrationDataFromJson(String str) => RegistrationData.fromJson(json.decode(str));

String registrationDataToJson(RegistrationData data) => json.encode(data.toJson());

class RegistrationData {
  int status;
  Data data;

  RegistrationData({
    required this.status,
    required this.data,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) => RegistrationData(
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
