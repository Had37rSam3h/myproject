import 'dart:async';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'dart:io';
import 'dart:convert';
import 'package:my_project/room.dart';
import 'package:my_project/main.dart';
import 'package:flutter/material.dart';
import 'package:my_project/login.dart';
import 'package:my_project/history.dart';
import 'package:my_project/firebase/auth.dart';
import 'package:my_project/firebase/firestore.dart';



class MyHome extends StatefulWidget {
  static const String id = 'home';
  const MyHome({super.key});


  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
   int _page = 0;

  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

   List<Widget> pages = [
     const MyHome(),
     const HistoryMeetingScreen(),
     const Text('Contacts'),
     TextButton(
       child: const Text('Log Out'),
       onPressed: () {
         AuthMethods().signOut();
       },
     ),
   ];

   createNewMeeting() async {
     String roomName = (Random().nextInt(1000000) + 1000000).toString();
     //_jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
   }

   joinMeeting(BuildContext context) {
     Navigator.pushNamed(context, 'room');
   }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
     appBar: AppBar(
       backgroundColor: Colors.black,
       elevation: 0,
       title: const Text("Let's Meet !"),
       shadowColor: Colors.indigo,
       centerTitle: true,
       /*leading: IconButton(
         onPressed: () {},
         icon: const Icon(Icons.arrow_back),
       ),*/
     ),
     body: Container(
       constraints: const BoxConstraints.expand(),
       child: Stack(
         children: [
           /*Container(
             decoration: const BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("Images/1.jpg"),
                 fit: BoxFit.cover,
               ),
             ),
           ),*/

           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [/*
               HomeMeetingButton(
                 onPressed: createNewMeeting,
                 text: 'New Meeting',
                 color: const Color.fromARGB(255,255, 112, 74),
                 icon: Icons.videocam,
               ),
               HomeMeetingButton(
                 onPressed: (){
                   Navigator.of(context).pushNamed(MyRoom.id);
                 },
                 text: 'Join Meeting',
                 icon: Icons.add_box_rounded,
               ),*/
               PopupMenuButton<int>(
                 onSelected: (result) {
                   if (result == 0) {
                     Navigator.of(context)
                         .pushNamed("room");
                   }
                 },
                 itemBuilder: (context) =>
                 [
                   const PopupMenuItem(
                     value: 0,
                     child: ListTile(
                       leading: Icon(
                         Icons.person,
                       ),
                       title: Text("Normal"),
                     ),),
                   const PopupMenuItem(
                     value: 1,
                     child: ListTile(
                       leading: Icon(Icons.person,),
                       title: Text("Love Reading"),
                     ),),
                 ],
                 child: Container(
                   height: 50,
                   width: 200,
                   decoration: const ShapeDecoration(
                     color: Colors.blue,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(
                         Radius.circular(16.0),
                       ),
                     ),
                   ),
                   child:
                   TextButton.icon(
                     onPressed: null,
                     icon: const Icon(Icons.video_call, color: Colors.white,),
                     label: const Text(
                       "New Meeting", style: TextStyle(color: Colors.white),),),

                 ),
               ),


               Container(
                 padding: const EdgeInsets.all(50),
                 child: TextFormField(
                   decoration: const InputDecoration(
                     enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue, width: 3,),
                     ),
                     labelText: 'Enter a code or link',
                     filled: true,
                     icon: Icon(Icons.link),
                   ),
                 ),
               ),

             ],
           ),
         ],),
     ),);
 }
}


class HomeMeetingButton extends StatelessWidget {
  dynamic onPressed;
  final IconData icon;
  final Color? color;
  final String text;
  HomeMeetingButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color ?? const Color.fromARGB(255, 0, 125, 234),
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: 55,
            height: 55,
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}