import 'package:al_azhar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class objectApp{
  static const bagroundApp = 'assets/bg_login.png';
  static const logoApp = 'assets/logo1.png';
  static const fontApp = 'Roboto1';
  static double labelFont = 12;
}

const String STORAGE_STATUS_LOGIN = "status";
const String STORAGE_EMAIL = "email";
const String STORAGE_TOKEN = "token";

List<Widget> IconMenu = [
  GradientIcon(
    FontAwesomeIcons.solidCreditCard,
    45.0,
    const LinearGradient(
      colors: <Color>[
        Colors.white,
        Colors.white,
        Colors.blue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  GradientIcon(
    FontAwesomeIcons.moneyBillTransfer,
    45.0,
    const LinearGradient(
      colors: <Color>[
        Colors.white,
        Colors.white,
        Colors.blue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  GradientIcon(
    FontAwesomeIcons.list,
    45.0,
    const LinearGradient(
      colors: <Color>[
        Colors.white,
        Colors.white,
        Colors.blue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  GradientIcon(
    FontAwesomeIcons.listCheck,
    45.0,
    const LinearGradient(
      colors: <Color>[
        Colors.white,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),GradientIcon(
    FontAwesomeIcons.sackDollar,
    45.0,
    const LinearGradient(
      colors: <Color>[
        Colors.white,
        Colors.white,
        Colors.blue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),GradientIcon(
    FontAwesomeIcons.users,
    45,
    const LinearGradient(
      colors: <Color>[
        Colors.white,
        Colors.white,
        // Colors.yellow,
        Colors.blue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
 ];
List TitleMenu = [
  'Bayar SPP',
  'Bayar Katering',
  'Daftar Ulang',
  'Riwayat Pembayaran',
  'Tabungan',
  'Data Siswa',
];