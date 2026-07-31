import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';

import 'providers/theme_provider.dart';
import 'providers/motion_provider.dart';

import 'routes/app_routes.dart';

class AntiTheftGuardian extends StatelessWidget {
  const AntiTheftGuardian({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => MotionProvider(),
        ),

      ],

      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: "Anti-Theft Guardian",

            theme: AppTheme.lightTheme,

            darkTheme: AppTheme.darkTheme,

            themeMode: themeProvider.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,

            initialRoute: AppRoutes.splash,

            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
