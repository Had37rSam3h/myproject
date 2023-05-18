import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'dart:io';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project/home.dart';
import 'package:my_project/room.dart';
import 'package:my_project/login.dart';
import 'package:my_project/firebase/auth.dart';
import 'package:my_project/firebase/firestore.dart';
import 'package:my_project/history.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: MyApp(),));}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
      routes: {
        'home' : (context) => const MyHome(),
        'room' : (context) => const MyRoom(),
        'login' : (context) => Login(),
        'history' : (context) => const HistoryMeetingScreen(),

        //Login.id: (context) =>Login(),

      },
    );
  }
}