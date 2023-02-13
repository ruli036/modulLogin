import 'package:al_azhar_app/controllers/homeController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemHomePageTagihan extends StatelessWidget {
  const ItemHomePageTagihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageC = Get.find<HomeController>();
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  width: size(context).width / 3 - 21,
                  child:const Text(
                    "Total Tagihan Biaya SPP",
                    style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: size(context).width / 3 - 21,
                  decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow:[
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            spreadRadius: 0.1,
                            offset: Offset(0,1)
                        )
                      ]
                  ),
                  child:const Padding(
                    padding:  EdgeInsets.all(8.0),
                      child: Center(child: Text('Rp. 1.500.000', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  ),
                ),
              )
            ],
          ), Column(
            children: [
              Container(
                  width: size(context).width / 3 - 22,
                  child:const Text(
                    "Total Tabungan Umroh",
                    style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: size(context).width / 3 - 22,
                  decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow:[
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            spreadRadius: 0.1,
                            offset: Offset(0,1)
                        )
                      ]
                  ),
                  child:const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Center(child: Text('Rp. 110.500.000', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  ),
                ),
              )
            ],
          ), Column(
            children: [
              Container(
                  width: size(context).width / 3 - 21,
                  child:const Text(
                    "Total Tagihan Catering",
                    style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: size(context).width / 3 - 21,
                  decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow:[
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            spreadRadius: 0.1,
                            offset: Offset(0,1)
                        )
                      ]
                  ),
                  child:const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Center(child: Text('Rp. 1.500.000', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
