import 'package:al_azhar_app/controllers/homeController.dart';
import 'package:al_azhar_app/service/helpers.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:al_azhar_app/views/homePages/itemHomeTagihanPage.dart';
import 'package:al_azhar_app/views/homePages/itemHomeTopPage.dart';
import 'package:al_azhar_app/views/homePages/itemMenuHomePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children:const [
          BagroundHome(),
          ItemHomePage()
        ],
      ),
    );
  }
}


class BagroundHome extends StatelessWidget {
  const BagroundHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200,
            decoration:const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.blue,
                    Colors.grey,
                  ],
                ),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),bottomLeft: Radius.circular(80))
            ),
          ),
        ),
        Positioned(
            left: 10,
            right: 10,
            bottom: 80,
            child: Opacity(
                opacity: 0.2,
                child: Image.asset(objectApp.logoApp,scale: 1.4,))
        )
      ],
    );
  }
}

class ItemHomePage extends StatelessWidget {
  const ItemHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
        ItemHomePageTop(),
        Padding(padding: EdgeInsets.all(15)),
        ItemHomePageTagihan(),
        Padding(padding: EdgeInsets.all(15)),
        ItemMenuHomePage()
      ],
    );
  }
}

