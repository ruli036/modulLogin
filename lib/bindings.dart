import 'package:al_azhar_app/controllers/homeController.dart';
import 'package:al_azhar_app/controllers/loginController.dart';
import 'package:al_azhar_app/controllers/lupaPassController.dart';
import 'package:al_azhar_app/controllers/verifikasiOtpController.dart';
import 'package:al_azhar_app/controllers/requestOtpController.dart';
import 'package:al_azhar_app/controllers/registerController.dart';
import 'package:al_azhar_app/controllers/splashScreenController.dart';
import 'package:get/get.dart';

class SplashBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplasScreenController());
  }
}
class LoginBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
class RequetOTPBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RequestOtpController());
  }
}
class VerifikasiOtpBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerifikasiOtpController());
  }
}
class VerifikasiOtpResetPassBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RequestOtpController());
    Get.lazyPut(() => VerifikasiOtpController());
  }
}

class RegitrasiBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegitrasiController());
  }
}
class LupaPasswordBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LupaPasswordController());
  }
}
class HomeBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
