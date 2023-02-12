import 'package:al_azhar_app/controllers/homeController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();
    return Scaffold(
      body: Obx(()=>
          Center(child: homeC.widgetOptions.elementAt(homeC.selectedIndex.value))
      ),
      floatingActionButton: Transform.scale(
        scale: 1.2,
        child: FloatingActionButton(
          child:const FaIcon(FontAwesomeIcons.wallet,size: 30,),
          onPressed: (){},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
          color: AppColors.buttonColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.house,color: Colors.white,),
              tooltip: "Home",
              onPressed: () {
                homeC.onItemTapped(0);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.users,color: Colors.white,),
                tooltip: "Users",
                onPressed: () {
                  homeC.onItemTapped(1);
                },
              ),
            ), IconButton(
              icon: FaIcon(FontAwesomeIcons.wallet,color: Colors.white,),
              tooltip: "Tabungan",
              onPressed: () {
                homeC.onItemTapped(2);
              },
            ), IconButton(
              icon: FaIcon(FontAwesomeIcons.gear,color: Colors.white,),
              tooltip: "Setting",
              onPressed: () {
                // homeC.onItemTapped(3);
                homeC.LogOut();
              },
            ),
          ],
        )
      ),

    );
  }
}
