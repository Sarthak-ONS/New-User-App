import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Services/request_helper.dart';
import '../Widgets/home_screen_drawer.dart';
import '../Widgets/home_screen_notice_list.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //FirebaseNotificationApi().showForegorundNotification();
  }

  Future x() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.uid);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => x(),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text('Please try again later!'),
                );
              }
              return Scaffold(
                key: _scaffoldKey,
                endDrawer: homeScreenDrawer(context),
                backgroundColor: Colors.white,
                floatingActionButton: snapshot.data!
                            .get("isVerifiedFromAdmin") ==
                        false
                    ? null
                    : FloatingActionButton.extended(
                        backgroundColor: AppColors.primaryColor,
                        onPressed: () async {
                          // Navigator.pushNamed(context, '/scanQRCodeWidget');
                          final data = await RequestHelper()
                              .request(endPoint: '/user/unlockDoor', bodyMap: {
                            "user_id": FirebaseAuth.instance.currentUser!.uid,
                            "user_name":
                                FirebaseAuth.instance.currentUser!.displayName,
                            "user_email":
                                FirebaseAuth.instance.currentUser!.email,
                          });
                          if (data != null) {
                            print(data);
                          }
                        },
                        isExtended: true,
                        label: Text(snapshot.data!.get("isAdmin") == true
                            ? "Open Gate"
                            : "Enter Lab"),
                        icon: const Icon(
                          Icons.login,
                        ),
                      ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NI LabView',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Transforming the skill landscape.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300,
                                    //fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState?.openEndDrawer();
                              },
                              child: CircleAvatar(
                                radius: 21,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'Asssets/Images_SVGs/menu.svg',
                                    height: 20,
                                    width: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const NoticeList()
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
