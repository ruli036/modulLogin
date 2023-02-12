import 'dart:convert';
import 'package:al_azhar_app/server/api_server.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  RxBool lihatpass = true.obs;
  final keyform = GlobalKey<FormState>();
  bool isLogin = false;
  bool status_login = false;
  String  token = "";
  void lihatpassword(){
    lihatpass.value = !lihatpass.value;
  }
  login()async{
    Get.defaultDialog(
        title: "LOADING",
        barrierDismissible: false,
        content: LoadingView(text: "Harap Tunggu...")
    );
    final respone = await http.post(Uri.parse(ApiUrl.login),
        body: {
          'email'  : email.text,
          'pass'   : password.text
        });
    final hasil = json.decode(respone.body);
    print('-----------------------------');
    print(hasil);
    print(respone.statusCode);
    // if(respone.statusCode == 200){
      if(hasil['status'] == true){
        bool status = hasil['status']??false;
        var token = hasil['token']??"";
        await StorageAPP.storageLogin(email.text,status,token);
        Get.back();
        Get.offAllNamed('/home-page');
      }else{
        Get.back();
        Get.defaultDialog(
            title: "WARNING",
            barrierDismissible: true,
            content: AlertErrorView(text: hasil['message'], colors: Colors.yellow,)
        );
      }
    // }else{
    //   // Get.back();
    //   // Get.defaultDialog(
    //   //     title: "ERROR",
    //   //     barrierDismissible: true,
    //   //     content: AlertErrorView(text: "Registrasi Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
    //   // );
    //
    // }
  }

  validasi(){
    final form = keyform.currentState;
    if (form!.validate()) {
      cekKoneksi(()=>login());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
}