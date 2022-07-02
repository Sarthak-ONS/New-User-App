import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Widgets/profile_picture.dart';
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
          .doc('ccGyAkVkXt9GiBFabDVc')
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: Stack(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilePicture(
                        photoUrl: snapshot.data['photoUrl'],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildNamewidget(snapshot),
                      buildEmailWidget(snapshot),
                      Text(
                        snapshot.data['Batch'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.italic,
                        ),
                      )
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
        fontSize: 16,
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
        snapshot.data['isNiLabViewMember']
            ? const Icon(Icons.verified_sharp)
            : Container()
      ],
    );
  }
}
