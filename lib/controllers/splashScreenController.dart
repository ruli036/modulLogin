import 'dart:async';
import 'package:al_azhar_app/service/objects.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplasScreenController extends GetxController{
  var app_version;
  String app_version_db = '';
  String link = '';
  String comment = '';
  bool status_login = false;
  String  token = "";

  keluar(){
    SystemNavigator.pop();
  }
  cekVersion()async{

  }
  Future cekLogin()async{
    status_login = GetStorage().read(STORAGE_STATUS_LOGIN)??false;
    token = GetStorage().read(STORAGE_TOKEN)??'';
    print('----------------------------------');
    print(status_login);
    print(token);
  }
  void timer(){
    Timer(const Duration(
        seconds: 3),
            (){
          if(status_login == false){
            Get.offAllNamed('/login');
          }else{
            Get.offAllNamed('/home-page');
          }
        }
    );
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cekLogin().whenComplete(() {
      timer();
    });
  }
}