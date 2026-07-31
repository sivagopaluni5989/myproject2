import 'package:flutter/material.dart';

import '../screens/intruder/intruder_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/history/history_screen.dart';
import '../screens/premium/premium_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/about/about_screen.dart';

import '../screens/security/security_screen.dart';

import '../screens/charger_guard/charger_screen.dart';
import '../screens/pocket_guard/pocket_screen.dart';
import '../screens/finder/finder_screen.dart';
import '../screens/battery_guard/battery_screen.dart';



class AppRoutes {

  AppRoutes._();



  static const splash = "/";

  static const home = "/home";

  static const history = "/history";

  static const premium = "/premium";

  static const settings = "/settings";

  static const about = "/about";


  // Intruder Guard
  static const intruder = "/intruder";


  // Security
  static const security = "/security";


  // Anti Theft Guards

  static const charger = "/charger";

  static const pocket = "/pocket";

  static const finder = "/finder";

  static const battery = "/battery";




  static final Map<String, WidgetBuilder> routes = {



    splash: (context) =>
        const SplashScreen(),



    home: (context) =>
        const HomeScreen(),



    history: (context) =>
        const HistoryScreen(),



    premium: (context) =>
        const PremiumScreen(),



    settings: (context) =>
        const SettingsScreen(),



    about: (context) =>
        const AboutScreen(),




    // Intruder Selfie Guard

    intruder: (context) =>
        const IntruderScreen(),




    // Security PIN

    security: (context) =>
        const SecurityScreen(),




    // Charger Guard

    charger: (context) =>
        const ChargerScreen(),




    // Pocket Guard

    pocket: (context) =>
        const PocketScreen(),




    // Clap / Whistle Finder

    finder: (context) =>
        const FinderScreen(),




    // Battery Guard

    battery: (context) =>
        const BatteryScreen(),


  };


}
