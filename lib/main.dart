import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

import 'providers/theme_provider.dart';
import 'providers/motion_provider.dart';
import 'providers/charger_provider.dart';
import 'providers/pocket_provider.dart';
import 'providers/finder_provider.dart';
import 'providers/battery_provider.dart';
import 'providers/intruder_provider.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  runApp(

    MultiProvider(

      providers: [


        ChangeNotifierProvider(

          create: (_) => ThemeProvider(),

        ),



        ChangeNotifierProvider(

          create: (_) => MotionProvider(),

        ),



        ChangeNotifierProvider(

          create: (_) => ChargerProvider(),

        ),



        ChangeNotifierProvider(

          create: (_) => PocketProvider(),

        ),



        ChangeNotifierProvider(

          create: (_) => FinderProvider(),

        ),



        ChangeNotifierProvider(

          create: (_) => BatteryProvider(),

        ),



        ChangeNotifierProvider(

          create: (_) => IntruderProvider(),

        ),


      ],



      child: const AntiTheftGuardian(),


    ),

  );

}
