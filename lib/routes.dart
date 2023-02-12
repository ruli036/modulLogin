import 'package:al_azhar_app/bindings.dart';
import 'package:al_azhar_app/views/home.dart';
import 'package:al_azhar_app/views/loginPages/loginPageView.dart';
import 'package:al_azhar_app/views/loginPages/lupaPasswordPageView.dart';
import 'package:al_azhar_app/views/loginPages/requestOtpPageView.dart';
import 'package:al_azhar_app/views/loginPages/registrasiPageView.dart';
import 'package:al_azhar_app/views/loginPages/verifikasiOtpPageView.dart';
import 'package:al_azhar_app/views/splashScreenView.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> route = [
  GetPage(name: '/splas-screen', page:()=> const SplasScreenView(),binding: SplashBindigs()),
  GetPage(name: '/request-otp', page:()=> const RequestOtpPageView(),binding: RequetOTPBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300)),
  GetPage(name: '/cek-otp', page:()=> const VerifikasiOTPPageView(),binding: VerifikasiOtpBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300)),
  GetPage(name: '/cek-otp-reset-pass', page:()=> const VerifikasiOTPPageView(),binding: VerifikasiOtpResetPassBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300),arguments: true),
  GetPage(name: '/registrasi-user', page:()=> const RegistrasiPageView(),binding: RegitrasiBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300)),
  GetPage(name: '/forgot-pass', page:()=> const LupaPasswordPageView(),binding: LupaPasswordBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300)),
  GetPage(name: '/reset-pass', page:()=> const RegistrasiPageView(),binding: RegitrasiBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300),arguments: true),
  GetPage(name: '/login', page:()=> const LoginPageView(),binding: LoginBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300)),
  GetPage(name: '/home-page', page:()=> const Home(),binding: HomeBindigs(),transition: Transition.rightToLeft,transitionDuration: Duration(milliseconds: 300)),
  // GetPage(name: '/home', page:()=> const HomeView()),
];

