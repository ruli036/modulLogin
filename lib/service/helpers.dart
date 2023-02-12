import 'dart:convert';
import 'dart:io';
import 'package:al_azhar_app/server/api_server.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:al_azhar_app/service/objects.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers{

}

emailValidate(value){
  final bool isValid = !EmailValidator.validate(value);
  return isValid;
}
class AppColors{
  static const buttonColor = Color.fromARGB(255, 	0, 162, 233);
  static const cancelButtonColor = Color.fromARGB(255, 	249, 94, 92);
  static const warningButtonColor = Color.fromARGB(255, 234, 210, 28);
  static const textColor = Color.fromARGB(255, 243, 240, 240);
  static const disableButtonColor = Color.fromARGB(255, 206, 206, 204);
}


extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

bool keyboardIsVisible(context) {
  return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
}

size(context){
  return MediaQuery.of(context).size;
}

Future<void> luncurkanbrowserdihp(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

class StorageAPP{
  static storageLogin(String email, bool status_login, String token){
    GetStorage().write(STORAGE_EMAIL, email);
    GetStorage().write(STORAGE_TOKEN, token);
    GetStorage().write(STORAGE_STATUS_LOGIN, status_login);
  }
}

Future requestOTP(email)async{
  Get.defaultDialog(
      title: "LOADING",
      barrierDismissible: false,
      content: LoadingView(text: "Mengirim Kode OTP")
  );
  final respone = await http.post(Uri.parse(ApiUrl.requestOpt),
      body: {
        'email' : email
      });
  final hasil = json.decode(respone.body);
  print('-----------------------------');
  print(hasil);
  // if(respone.statusCode == 201){
  if(hasil['status'] == true){
    Get.back();
    Get.toNamed("/cek-otp");
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
  //       content: AlertErrorView(text: "Request OTP Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
  //   );
  // }
}

Future requestOTPResetPassword(email)async{

  Get.defaultDialog(
      title: "LOADING",
      barrierDismissible: false,
      content: LoadingView(text: "Mengirim Kode OTP")
  );
  final respone = await http.post(Uri.parse(ApiUrl.requestOptResetPass),
      body: {
        'email' : email
      });
  final hasil = json.decode(respone.body);
  print('-----------------------------');
  print(hasil);
  // if(respone.statusCode == 201){
  if(hasil['status'] == true){
    Get.back();
    Get.toNamed("/cek-otp-reset-pass",arguments: true);
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
  //       content: AlertErrorView(text: "Request OTP Gagal, Harap Mencoba Beberapa Saat Lagi ", colors: Colors.red,)
  //   );
  // }
}

Future cekKoneksi(Function action)async{
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      action();
    }
  } on SocketException catch (_) {
    Get.defaultDialog(
        title: "INFO",
        barrierDismissible: true,
        content: AlertErrorView(text: 'Tidak Ada Koneksi Internet', colors: Colors.yellow,)
    );
  }
}