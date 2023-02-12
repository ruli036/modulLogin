import 'dart:async';

import 'package:al_azhar_app/controllers/loginController.dart';
import 'package:al_azhar_app/controllers/verifikasiOtpController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifikasiOTPPageView extends StatelessWidget {
  const VerifikasiOTPPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpC = Get.find<VerifikasiOtpController>();
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: size(context).height,
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(objectApp.bagroundApp),
                    fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  AnimatedContainer(
                    height:  keyboardIsVisible(context)?50:size(context).width / 2  ,
                    duration:const Duration(milliseconds: 500),
                    child: Image.asset(objectApp.logoApp,scale: 2,),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  const Center(child: Text('Verifikasi Kode OTP!!! ', style: TextStyle( fontSize:25,color: Colors.grey,fontFamily: objectApp.fontApp),)),
                  const Padding(padding: EdgeInsets.all(15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Container(
                        decoration:const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  spreadRadius: 2.2,
                                  offset: Offset(1,1)
                              )
                            ]
                        ),
                        child: Padding(
                          padding:const EdgeInsets.only(left: 30,right: 30,top: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  OtpInput(otpC.fieldOne, true), // auto focus
                                  OtpInput(otpC.fieldTwo, false),
                                  OtpInput(otpC.fieldThree, false),
                                  OtpInput(otpC.fieldFour, false),
                                  OtpInput(otpC.fieldFive, false)
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(bottom: 10)),
                              Obx(()=>
                                 Container(
                                    height: 50,
                                    width: size(context).width,
                                    decoration: BoxDecoration(
                                        color: otpC.otp.value.length == 5 ?AppColors.buttonColor:AppColors.disableButtonColor,
                                        borderRadius:const BorderRadius.all(Radius.circular(15))
                                    ),
                                    child: TextButton(
                                      onPressed: (){
                                        otpC.validasi();
                                      },
                                      child: Text("SUBMIT",style: TextStyle(color: Colors.white)),
                                    )
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(10)),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 2,
                                      child: Text('Kirim Ulang Kode?', style: TextStyle( fontSize:15,color: Colors.grey,fontFamily: objectApp.fontApp),)
                                  ),
                                   Expanded(
                                    flex: 1,
                                    child: Obx(()=>
                                        Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: otpC.KirimKodeUlang.value == true ?AppColors.buttonColor:AppColors.disableButtonColor,
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        child: TextButton(
                                            onPressed: (){
                                              if (otpC.time.value == 0) {
                                                otpC.requestOptAgain();
                                              }
                                            },
                                            child: Text('Kirim Kode ${otpC.time.value}', style: TextStyle( fontSize:12,color: Colors.white,fontFamily: objectApp.fontApp),)
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Padding(padding: EdgeInsets.all(10)),
                            ],

                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
