import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/Login/login.dart';
import 'package:login_page/OnBoarding/onboarding.dart';
import 'package:login_page/Register/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'onboarding',
          routes: {
            'onboarding': (context) => const OnBoarding(),
            'login': (context) => const MyLogin(),
            'register': (context) => const MyRegister(),
          },
        );
      },
    );
  }
}
