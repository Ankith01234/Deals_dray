
// import 'package:deals_dray/device_id/device_id_controller/device_id_controller.dart';
import 'package:deals_dray/login_screen/login_screen_controller/login_screen_controller.dart';
import 'package:deals_dray/verify_otp_screen/verify_otp_controller/verify_otp_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../registration_page/registration_page_controller/registration_page_controller.dart';

// final deviceIdProvider=ChangeNotifierProvider<DeviceIdController>((ref){
//   return DeviceIdController();
// });

final otpProvider=ChangeNotifierProvider<LoginScreenController>((ref){
  return LoginScreenController();
});

final otpVerifyProvider=ChangeNotifierProvider<VerifyOtpController>((ref){
  return VerifyOtpController();
});

final registerProvider=ChangeNotifierProvider<RegistrationPageController>((ref){
  return RegistrationPageController();
});
