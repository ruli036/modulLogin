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
          }else{
            FocusScope.of(context).previousFocus();
          }
          otpC.otp.value = '${otpC.fieldOne.text}${otpC.fieldTwo.text}${otpC.fieldThree.text}${otpC.fieldFour.text}${otpC.fieldFive.text}';
          if(otpC.otp.value.length == 5){
            otpC.validasi();
          }
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
class KonfirmasiLogOut extends StatelessWidget {
  String text;
  KonfirmasiLogOut({Key? key,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
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
class ListDataSiswa extends StatelessWidget {
  String text;
  ListDataSiswa({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) =>  Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 1,
                    spreadRadius: 0.1,
                    offset: Offset(0,1)
                )
              ]
          ),
          child: ListTile(
            title: Text("Anak ${index+1}", style: TextStyle(fontFamily: objectApp.fontApp ), textAlign: TextAlign.center),
            onTap: (){
              print(index);
            },
          ),
        ),
      ), ),
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

class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: FaIcon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}