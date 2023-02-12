import 'package:al_azhar_app/controllers/splashScreenController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplasScreenView extends StatelessWidget {
  const SplasScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashC = Get.find<SplasScreenController>();
    return WillPopScope(
      onWillPop: (){
        return splashC.keluar();
      },
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: size(context).height,
          decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg_login.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            children:[
              Expanded(child: Container()),
              CircleAvatar(
                radius: 100,
                child: Image.asset('assets/logo1.png',scale: 2,),
              ),
              Expanded(child: Container()),
              const Center(child: CircularProgressIndicator()),
              const Padding(padding: EdgeInsets.all(10)),
              const Center(child: Text('Al-Azhar Cairo Banda Aceh', style: TextStyle(fontSize:13,color: Colors.black45,fontFamily: objectApp.fontApp),)),
              const Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }
}
