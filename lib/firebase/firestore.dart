import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream get meetingHis => _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').snapshots();

  void addToMeetingHistory(String meetingName) async {
    try{
      await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').add(
          {
            'meetingName' : meetingName,
            'meetingDate':DateTime.now(),
          }
      );
    } catch (e, stackTrace) {
      print('Caught exception: $e\n$stackTrace');}
  }

}