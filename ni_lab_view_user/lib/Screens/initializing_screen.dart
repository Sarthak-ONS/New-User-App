import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ni_lab_view_user/Screens/login_screen.dart';
import 'package:ni_lab_view_user/Services/firebase_notification_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ni_lab_view_user/constants.dart';

class InitializingScreen extends StatefulWidget {
  const InitializingScreen({Key? key}) : super(key: key);

  @override
  State<InitializingScreen> createState() => _InitializingScreenState();
}

class _InitializingScreenState extends State<InitializingScreen> {
  Future initFirebaseApp() async {
    FirebaseNotificationApi.initialize(context);
    FirebaseNotificationApi().allNotifications();
    return await Firebase.initializeApp();
  }

  changeServerUrl() async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('ServerUrl')
        .doc('nA3kzqCRHnVeA01qImEm')
        .get();
    serverHost = snapshot.get("serverUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: initFirebaseApp(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.error == null) {
            changeServerUrl();
            return const LoginScreen();
          }
          return const Center(
            child: Text('Please try again later'),
          );
        },
      ),
    );
  }
}
