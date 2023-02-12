import 'dart:convert';

import 'package:al_azhar_app/controllers/lupaPassController.dart';
import 'package:al_azhar_app/controllers/requestOtpController.dart';
import 'package:al_azhar_app/server/api_server.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegitrasiController extends GetxController{
  TextEditingController password= TextEditingController();
  TextEditingController confirmPassword= TextEditingController();
  RxBool lihatpass = true.obs;
  final keyform = GlobalKey<FormState>();
  final storage = GetStorage();
  bool isLogin = false;
  bool resetPassword = Get.arguments ?? false;
  void lihatpassword(){
    lihatpass.value = !lihatpass.value;
  }
  final RegistrasiC = Get.find<RequestOtpController>();
  final ResetPasswodC = Get.find<LupaPasswordController>();
  registrasiUser()async{
    Get.defaultDialog(
        title: "LOADING",
        barrierDismissible: false,
        content: LoadingView(text: "Harap Tunggu...")
    );
    final respone = await http.post(Uri.parse(ApiUrl.registrasi),
        body: {
          'email'  : RegistrasiC.email.text,
          'nohp'   : RegistrasiC.noHp.text,
          'pass'   : password.text
        });
    final hasil = json.decode(respone.body);
    print('-----------------------------');
    print(hasil);
    print(respone.statusCode);
    // if(respone.statusCode == 201){
      if(hasil['status'] == true){
        Get.back();
        Get.defaultDialog(
            title: "INFO",
            barrierDismissible: true,
            content: AlertSuccesView(text: hasil['message'], colors: Colors.green,),
            textConfirm: "OK",
            onConfirm: (){
              Get.offAllNamed('/login');
            }
        );
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
    //       content: AlertErrorView(text: "Registrasi Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
    //   );
    // }
  }
  resetPasswordBaru()async{
    Get.defaultDialog(
        title: "LOADING",
        barrierDismissible: false,
        content: LoadingView(text: "Harap Tunggu...")
    );
    final respone = await http.post(Uri.parse(ApiUrl.resetPassword),
        body: {
          'email'  : ResetPasswodC.email.text,
          'pass'   : password.text
        });
    final hasil = json.decode(respone.body);
    print('-----------------------------');
    print(hasil);
    print(respone.statusCode);
    // if(respone.statusCode == 201){
      if(hasil['status'] == true){
        Get.back();
        Get.defaultDialog(
            title: "INFO",
            barrierDismissible: true,
            content: AlertSuccesView(text: hasil['message'], colors: Colors.green,),
            textConfirm: "OK",
            onConfirm: (){
              Get.offAllNamed('/login');
            }
        );
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
    //       content: AlertErrorView(text: "Registrasi Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
    //   );
    // }
  }

  validasi(){
    final form = keyform.currentState;
    if (form!.validate()) {
      if(password.text != confirmPassword.text){
        Get.defaultDialog(
            title: "WARNING",
            barrierDismissible: true,
            content: AlertErrorView(text: "Confirmasi Password Tidak Cocok", colors: Colors.yellow,)
        );
      }else{
        if(resetPassword == true){
          cekKoneksi(()=>resetPasswordBaru());
        }else{
          cekKoneksi(()=>registrasiUser());
        }

      }

    }
  }

}