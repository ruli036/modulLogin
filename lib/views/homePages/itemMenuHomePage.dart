import 'package:al_azhar_app/controllers/homeController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemMenuHomePage extends StatelessWidget {
  const ItemMenuHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageC = Get.find<HomeController>();
    return Expanded(
      child: ListView(
        children: [
          Center(
            child: Wrap(
              spacing: 15, // gap between adjacent chips
              runSpacing: 20,
              children: List.generate(IconMenu.length, (index){
                return
                  GestureDetector(
                    onTap: (){
                      print("do something ${TitleMenu[index]}");
                      print("do something ${index}");
                      if(index == 5){

                      }else{
                        Get.defaultDialog(
                          title: "List Siswa",
                          content: ListDataSiswa(text: "Keluar Dari Akun Anda?"),
                          confirmTextColor: AppColors.textColor,
                        );
                      }
                    },
                    child: Container(
                      width: size(context).width / 3 - 20,
                      height: 120,
                      decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 4,
                                spreadRadius: 0.1,
                                offset: Offset(0,1)
                            )
                          ]
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            decoration:const BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconMenu[index],
                                Text(
                                  TitleMenu[index],
                                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
              }),
            ),
          )
        ],
      ),
    );
  }
}
