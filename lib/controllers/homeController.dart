import 'dart:async';

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

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget> [
    HomePageView(),
    Text(
      'Index 1: Siswa',
      style: optionStyle,
    ),
    Text(
      'Index 2: Tabungan',
      style: optionStyle,
    ),
    Text(
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
        barrierDismissible: false,
        content: LoadingView(text: "Harap Tunggu...")
    );
    Timer(const Duration(
        seconds: 3),
            (){
              GetStorage().erase();
              Get.offAllNamed("/login");
        }
    );

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = GetStorage().read(STORAGE_EMAIL);
  }
}