import 'dart:async';

import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:al_azhar_app/views/homePages/homePageView.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{
  var email;
  RxInt selectedIndex = 0.obs;
  String date = DateFormat('dd').format(DateTime.now());
  String month = DateFormat('MMMM').format(DateTime.now());
  String year = DateFormat('yyyy').format(DateTime.now());
  DateTime? currentBackPressTime;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget> [
    const HomePageView(),
    const Text(
      'Index 1: Siswa',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Tabungan',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void onItemTapped(int index) {
      selectedIndex.value = index;
  }
  Future LogOut()async{
    Get.defaultDialog(
        title: "Log Out",
        barrierDismissible: true,
        content: KonfirmasiLogOut(text: "Keluar Dari Akun Anda?"),
      textConfirm: "Keluar",
      textCancel: "Cancel",
      confirmTextColor: AppColors.textColor,
      // buttonColor:AppColors.cancelButtonColor ,
      onConfirm: (){
        GetStorage().erase();
        Get.offAllNamed("/login");
      }
    );

  }

  Future<bool> onWillPop(context)async{
    if(selectedIndex.value == 0){
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        const snackBar = SnackBar(
          content: Text('Klik 2 Kali! Untuk Keluar!',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          duration: Duration(milliseconds: 1300),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return Future.value(false);
      }
      return Future.value(true);

    }else{
      selectedIndex.value = 0;
      return Future.value(false);
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = GetStorage().read(STORAGE_EMAIL);
  }
}