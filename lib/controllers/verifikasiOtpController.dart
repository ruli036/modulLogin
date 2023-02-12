import 'dart:async';
import 'dart:convert';
import 'package:al_azhar_app/controllers/lupaPassController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:al_azhar_app/controllers/requestOtpController.dart';
import 'package:al_azhar_app/server/api_server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifikasiOtpController extends GetxController{
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  RxString otp = ''.obs;
  RxInt time = 60.obs;
  RxBool KirimKodeUlang = false.obs;
  bool resetPassword = Get.arguments ?? false;
  final RegistrasiC = Get.find<RequestOtpController>();
  final ResetPasswordC = Get.find<LupaPasswordController>();
  verifikasiOtp()async{
    Get.defaultDialog(
        title: "LOADING",
        barrierDismissible: false,
        content: LoadingView(text: "Verifikasi Kode OTP")
    );
    final respone = await http.post(Uri.parse(ApiUrl.verivikasiOtp),
        body: {
          'email' : RegistrasiC.email.text,
          'otp'   : otp.value
        });
    final hasil = json.decode(respone.body);
    print('-----------------------------');
    print(hasil);
    // if(respone.statusCode == 200){
      if(hasil['status'] == true){
        Get.back();
          Get.toNamed('/registrasi-user');
      }else{
        Get.back();
          Get.defaultDialog(
              title: "WARNING",
              barrierDismissible: true,
              content: AlertErrorView(text: hasil['message'], colors: Colors.yellow,)
          );
      }
    // }else{
    //   Get.back();
    //   Get.defaultDialog(
    //       title: "ERROR",
    //       barrierDismissible: true,
    //       content: AlertErrorView(text: "Verifikasi Kode OTP Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
    //   );
    // }
  }
  verifikasiOtpResetPass()async{
    Get.defaultDialog(
        title: "LOADING",
        barrierDismissible: false,
        content: LoadingView(text: "Verifikasi Kode OTP")
    );
    final respone = await http.post(Uri.parse(ApiUrl.verivikasiOtp),
        body: {
          'email' : ResetPasswordC.email.text,
          'otp'   : otp.value
        });
    final hasil = json.decode(respone.body);
    print('-----------------------------');
    print(hasil);
    // if(respone.statusCode == 200){
      if(hasil['status'] == true){
        Get.back();
          Get.toNamed('/reset-pass',arguments: true);
      }else{
        Get.back();
          Get.defaultDialog(
              title: "WARNING",
              barrierDismissible: true,
              content: AlertErrorView(text: hasil['message'], colors: Colors.yellow,)
          );
      }
    // }else{
    //   Get.back();
    //   Get.defaultDialog(
    //       title: "ERROR",
    //       barrierDismissible: true,
    //       content: AlertErrorView(text: "Verifikasi Kode OTP Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
    //   );
    // }
  }
  validasi(){
    if(otp.value.length == 5){
      if(resetPassword == true){
        cekKoneksi(()=>verifikasiOtpResetPass());
      }else{
        cekKoneksi(()=>verifikasiOtp());
      }

    }
  }
  requestOptAgain(){
    if(resetPassword == true){
      cekKoneksi(()=>requestOTPResetPassword(ResetPasswordC.email.text));
    }else{
      cekKoneksi(()=>requestOTP(RegistrasiC.email.text));

    }

    time.value = 70;
    KirimKodeUlang.value = false;
  }
  void timer(){
    Timer.periodic(const Duration(
        seconds: 1), (timer) {
      if (time.value == 0) {
        KirimKodeUlang.value = true;
      } else {
        time.value--;
      }
    });
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    timer();
  }

}