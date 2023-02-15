import 'package:al_azhar_app/controllers/loginController.dart';
import 'package:al_azhar_app/controllers/requestOtpController.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:al_azhar_app/views/home.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RequestOtpPageView extends StatelessWidget {
  const RequestOtpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regisC = Get.find<RequestOtpController>();
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
                    const Center(child: Text('Registrasi Akun!!! ', style: TextStyle( fontSize:25,color: Colors.grey,fontFamily: objectApp.fontApp),)),
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
                          child: Form(
                            key: regisC.keyform,
                            child: Padding(
                              padding:const EdgeInsets.only(left: 30,right: 30,top: 20),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: regisC.noHp,
                                    validator: (e){
                                      if(e!.isEmpty){
                                        return 'Masukkan Nomor Hp Anda';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    maxLength: 15,
                                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                    decoration: InputDecoration(
                                      labelText: 'Nomor Hp',
                                      labelStyle: TextStyle(fontSize: objectApp.labelFont),
                                      prefixIcon:const Icon(Icons.account_circle,color: Colors.blue,),
                                      border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20),)
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(5)),
                                  TextFormField(
                                    controller: regisC.email,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (e){
                                      if (e!.isEmpty) {
                                        return 'Masukkan Email Anda';
                                      }else if(emailValidate(e)){
                                        return 'Email Anda Tidak Valid';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(fontSize: objectApp.labelFont),
                                      prefixIcon:const Icon(Icons.email,color: Colors.blue,),
                                      border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20),)
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                                  Container(
                                      height: 50,
                                      width: size(context).width,
                                      decoration: const BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      // ignore: deprecated_member_use
                                      child: TextButton(
                                        onPressed: (){
                                          regisC.validasi();
                                        },
                                        child:const Text("SUBMIT",style: TextStyle(color: Colors.white)),
                                      )
                                  ),
                                  const Padding(padding: EdgeInsets.all(10)),
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text('Sudah Punya Akun?', style: TextStyle( fontSize:15,color: Colors.grey,fontFamily: objectApp.fontApp),)),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              color: AppColors.buttonColor,
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: TextButton(
                                              onPressed: (){
                                                Get.offAllNamed('/login');
                                              },
                                              child: const Text('Login', style: TextStyle( fontSize:12,color: Colors.white,fontFamily: objectApp.fontApp),)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(10)),

                                ],

                              ),
                            ) ,
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
