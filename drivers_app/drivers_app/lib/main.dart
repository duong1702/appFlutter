// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:io';

import 'package:drivers_app/pages/dashboard.dart';
import 'package:drivers_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'authentication/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDmOjP17oJ4-cabYB2V1Eos7PAEThUCVAo",
            authDomain: "bookingapp-19efc.firebaseapp.com",
            projectId: "bookingapp-19efc",
            storageBucket: "bookingapp-19efc.appspot.com",
            messagingSenderId: "262205626491",
            appId: "1:262205626491:web:36d625ab571ad6363ceade",
            measurementId: "G-HVZXW4XC7V"));
  } else {
    await Firebase.initializeApp();
  }

  await Permission.notification.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.notification.request();
    }
  }
  );

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.locationWhenInUse.request();
    }
  }
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver',
      debugShowCheckedModeBanner:
          false, //xoa banner debug mac dinh tren ung dung
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : Dashboard(),
    );
  }
}
