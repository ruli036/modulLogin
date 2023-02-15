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
    return WillPopScope(
      onWillPop: ()=>homeC.onWillPop(context),
      child: Scaffold(
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
        bottomNavigationBar: Obx(()=>
           BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
              color: AppColors.buttonColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.house,color: homeC.selectedIndex == 0?Colors.white:Colors.grey.shade300,size: homeC.selectedIndex == 0?25:null,),
                  tooltip: "Home",
                  onPressed: () {
                    homeC.onItemTapped(0);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.users,color: homeC.selectedIndex == 1?Colors.white:Colors.grey.shade300,size: homeC.selectedIndex == 1?25:null,),
                    tooltip: "Users",
                    onPressed: () {
                      homeC.onItemTapped(1);
                    },
                  ),
                ), IconButton(
                  icon: FaIcon(FontAwesomeIcons.wallet,color: homeC.selectedIndex == 2?Colors.white:Colors.grey.shade300,size: homeC.selectedIndex == 2?25:null,),
                  tooltip: "Tabungan",
                  onPressed: () {
                    homeC.onItemTapped(2);
                  },
                ), IconButton(
                  icon: FaIcon(FontAwesomeIcons.gear,color: homeC.selectedIndex == 3?Colors.white:Colors.grey.shade300,size: homeC.selectedIndex == 3?25:null,),
                  tooltip: "Setting",
                  onPressed: () {
                    // homeC.onItemTapped(3);
                    homeC.LogOut();
                  },
                ),
              ],
            )
          ),
        ),

      ),
    );
  }
}
