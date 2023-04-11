import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Services/fireabase_api.dart';
import '../../Widgets/build_approve_deny_button.dart';
import '../../app_colors.dart';

class PermanentRequestApprovalScreen extends StatefulWidget {
  const PermanentRequestApprovalScreen({Key? key}) : super(key: key);

  @override
  State<PermanentRequestApprovalScreen> createState() =>
      _PermanentRequestApprovalScreenState();
}

class _PermanentRequestApprovalScreenState
    extends State<PermanentRequestApprovalScreen> {
  Color kIconColor = Colors.blueAccent;
  int kIconSize = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Users')
            .where("isVerifiedFromAdmin", isEqualTo: false)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
              return PermanentRequestCard(
                kIconColor: kIconColor,
                snapshot: snapshot,
                index: index,
                callback: () {
                  print(snapshot.data!.docs[index].get("UniqueID"));
                  FirebaseApi().approvePermanentVerification(
                    snapshot.data!.docs[index].get("UniqueID"),
                    snapshot.data!.docs[index].get("Name"),
                    snapshot.data!.docs[index].get("Email"),
                  );
                  setState(() {});
                },
              );
            }),
          );
        },
      ),
    );
  }
}

class PermanentRequestCard extends StatelessWidget {
  const PermanentRequestCard(
      {Key? key,
      required this.kIconColor,
      required this.snapshot,
      required this.index,
      required this.callback})
      : super(key: key);

  final Color kIconColor;
  final AsyncSnapshot snapshot;
  final Function callback;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black54,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: kIconColor,
              ),
              Text(" : ${snapshot.data!.docs[index].get("Name")}"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.mail_outline,
                color: kIconColor,
              ),
              Text(" : ${snapshot.data!.docs[index].get("Email")}"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.engineering,
                color: kIconColor,
              ),
              Text(" : ${snapshot.data!.docs[index].get("Branch")}"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.badge_outlined,
                color: kIconColor,
              ),
              Text(" : ${snapshot.data!.docs[index].get("StudentNo")}"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.call,
                color: kIconColor,
              ),
              Text(" : ${snapshot.data!.docs[index].get("ContactNo")}"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              buildApproveDenyButton('Verify', () {
                print("Approve Request");
                callback();
              }, Colors.green),
              const SizedBox(
                width: 15.0,
              ),
              buildApproveDenyButton('Deny', () {}, Colors.red),
            ],
          )
        ],
      ),
    );
  }
}
