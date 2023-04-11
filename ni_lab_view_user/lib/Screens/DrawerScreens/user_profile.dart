import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../app_colors.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Center(
              child: LinearProgressIndicator(
                backgroundColor: AppColors.primaryColor,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Please try again later'),
          );
        }
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const Text(
              'My Profile',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNamewidget(snapshot),
                  const SizedBox(
                    height: 15,
                  ),
                  buildEmailWidget(snapshot),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    snapshot.data['Branch'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    snapshot.data['StudentNo'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    snapshot.data['ContactNo'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text('Verification Status : '),
                      Text(
                        snapshot.data['isVerifiedFromAdmin'] == true
                            ? 'Verified'
                            : 'Waiting for verification',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Text buildEmailWidget(AsyncSnapshot<dynamic> snapshot) {
    return Text(
      snapshot.data['Email'],
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Row buildNamewidget(AsyncSnapshot<dynamic> snapshot) {
    return Row(
      children: [
        Text(
          snapshot.data['Name'],
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        snapshot.data['isVerifiedFromAdmin']
            ? const Icon(Icons.verified_sharp)
            : Container()
      ],
    );
  }
}
