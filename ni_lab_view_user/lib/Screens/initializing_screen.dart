import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ni_lab_view_user/Services/firebase_notification_api.dart';
import 'home_screen.dart';

class InitializingScreen extends StatefulWidget {
  const InitializingScreen({Key? key}) : super(key: key);

  @override
  State<InitializingScreen> createState() => _InitializingScreenState();
}

class _InitializingScreenState extends State<InitializingScreen> {
  Future initFirebaseApp() async {
    //WidgetsFlutterBinding.ensureInitialized();
    // FirebaseMessaging.onBackgroundMessage(
    //     FirebaseNotificationApi().firebaseMessagingBackgroundHandler);
    FirebaseNotificationApi.initialize(context);
    return await Firebase.initializeApp();
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
            return const HomeScreen();
          }
          return const Center(
            child: Text('Please try again later'),
          );
        },
      ),
    );
  }
}
