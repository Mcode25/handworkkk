import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_worker.dart';
import 'package:flutter_application_1/screen/intro_screen.dart';
import 'package:flutter_application_1/screen/user.dart';
import 'package:flutter_application_1/screen/Login.dart';
import 'package:flutter_application_1/screen/forgetPassword.dart';
import 'package:flutter_application_1/screen/home_user.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
      initialRoute: 'IntroScreen',
      routes: {
        'forgetPassword': (context) => ForgetPassword(),
        'user': (context) => const user(),
        'home_user': (context) => const SearchPage(),
        'home_worker': (context) =>  const WorkerPage(),
        'LoginScreen': (context) => const LoginScreen(),
        'IntroScreen': (context) => IntroScreen(),
      }
    );
  }
}
