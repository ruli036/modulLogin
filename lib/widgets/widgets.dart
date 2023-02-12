import 'package:al_azhar_app/controllers/verifikasiOtpController.dart';
import 'package:al_azhar_app/service/objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpC = Get.find<VerifikasiOtpController>();
    return SizedBox(
      height: 50,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10), 
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          otpC.otp.value = '${otpC.fieldOne.text}${otpC.fieldTwo.text}${otpC.fieldThree.text}${otpC.fieldFour.text}${otpC.fieldFive.text}';
        },
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  String text;
  LoadingView({Key? key,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset(objectApp.logoApp),
          ),
          Text(
              text,
              style:const TextStyle(fontFamily: objectApp.fontApp ),
              textAlign: TextAlign.center
          ),
          const Padding(
            padding:  EdgeInsets.only(top: 10),
            child: CircularProgressIndicator(),
          ),

        ],
      ),
    );
  }
}
class AlertErrorView extends StatelessWidget {
  String text;
  final MaterialColor colors;
  AlertErrorView({Key? key,required this.text,required this.colors }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding:const EdgeInsets.only(bottom: 10),
          child: FaIcon(FontAwesomeIcons.circleExclamation,color: colors,size: 50,),
        ),
        Text(
          text,
          style: const TextStyle(fontFamily: objectApp.fontApp ),
          textAlign: TextAlign.center
        ),

      ],
    );
  }
}

class AlertSuccesView extends StatelessWidget {
  String text;
  final MaterialColor colors;
  AlertSuccesView({Key? key,required this.text,required this.colors }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        children: [
           Padding(
            padding:const EdgeInsets.only(bottom: 10),
            child: FaIcon(FontAwesomeIcons.circleCheck,color: colors,size: 50,),
          ),
          Text(
            text,
            style: const TextStyle(fontFamily: objectApp.fontApp ),
            textAlign: TextAlign.center
          ),

        ],
      ),
    );
  }
}