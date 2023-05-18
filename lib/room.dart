import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_project/home.dart';
import 'package:my_project/main.dart';
import 'package:flutter/material.dart';
import 'package:my_project/login.dart';
import 'package:my_project/history.dart';
import 'package:my_project/firebase/auth.dart';
import 'package:my_project/firebase/firestore.dart';

const appId = 'c449c1d86f704956b2507dd87461a938';
String channelName = 'project';
String token = '007eJxTYLCvLwnVNGv8Jl+5Vy1wnhh/Tw7/RIV0QQOFaYx8cxjN9BQYkk1MLJMNUyzM0swNTCxNzZKMTA3MU1IszE3MDBMtjS3kNGJTGgIZGQrkvrAyMkAgiM/OUFCUn5WaXMLAAACs3Bmd';
int uid = 1; // uid of the local user


class MyRoom extends StatefulWidget {
  static const String id = 'room';
  const MyRoom({Key? key}) : super(key: key);
  @override
  State<MyRoom> createState() => _MyRoomState();
}
class _MyRoomState extends State<MyRoom> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appId,
      channelName: channelName,
      tempToken: token,
      uid: uid,
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

//Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Meet !"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              enableHostControls: true, // Add this to enable host controls
            ),
            AgoraVideoButtons(
              client: client,
            ),
          ],
        ),
      ),
    );
  }
}