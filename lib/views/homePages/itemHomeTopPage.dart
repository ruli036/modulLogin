import 'package:al_azhar_app/controllers/homeController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemHomePageTop extends StatelessWidget {
  const ItemHomePageTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageC = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FaIcon(FontAwesomeIcons.solidCircleUser,size: 55,color: Colors.white,),
          Expanded(
            child:  Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text("${homePageC.email.toString().toCapitalized()}",style: TextStyle(fontFamily: objectApp.fontApp,color: AppColors.textColor,fontSize: 17),maxLines: 2),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(child: Text('${homePageC.date}', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),)),
          ),
          // Text(homePageC.month, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${homePageC.month}', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text('${homePageC.year}', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
