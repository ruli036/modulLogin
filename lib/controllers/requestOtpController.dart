import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestOtpController extends GetxController{
  TextEditingController noHp= TextEditingController();
  TextEditingController email= TextEditingController();
  final keyform = GlobalKey<FormState>();
  final storage = GetStorage();

  validasi(){
    final form = keyform.currentState;
    if (form!.validate()) {
      Get.defaultDialog(
            title: "LOADING",
            barrierDismissible: false,
            content: LoadingView(text: "Mengirim Kode OTP")
          );
      cekKoneksi(()=>requestOTP(email.text));
    }
  }

}