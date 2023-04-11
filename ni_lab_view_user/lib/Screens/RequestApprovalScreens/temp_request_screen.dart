import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ni_lab_view_user/Services/fireabase_api.dart';
import 'package:readmore/readmore.dart';
import '../../Services/hardware_functions.dart';
import '../../Widgets/build_approve_deny_button.dart';
import '../../app_colors.dart';
import '../../app_theme.dart';

class TempRequestApprovalScreen extends StatefulWidget {
  const TempRequestApprovalScreen({Key? key}) : super(key: key);

  @override
  State<TempRequestApprovalScreen> createState() =>
      _TempRequestApprovalScreenState();
}

class _TempRequestApprovalScreenState extends State<TempRequestApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('NewAdminRequests')
            .orderBy('createdAt', descending: true)
            .get(),
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Center(
                child: CircularProgressIndicator(
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return TempRequestApprovalCard(
                name: snapshot.data!.docs[index].get("Name"),
                email: snapshot.data!.docs[index].get("Email"),
                message: snapshot.data!.docs[index].get("Message"),
                time: snapshot.data!.docs[index].get("createdAt").toString(),
                id: snapshot.data!.docs[index].get("id"),
                callback: () async {
                  await Door().unlockDoor();
                  await FirebaseApi()
                      .deleteTempRequest(snapshot.data!.docs[index].get("id"));
                  setState(() {});
                },
              );
            },
          );
        }),
      ),
    );
  }
}

class TempRequestApprovalCard extends StatefulWidget {
  final String name;
  final String email;
  final String message;
  final String time;
  final String id;
  final Function callback;

  const TempRequestApprovalCard(
      {Key? key,
      required this.name,
      required this.email,
      required this.message,
      required this.time,
      required this.id,
      required this.callback})
      : super(key: key);

  @override
  State<TempRequestApprovalCard> createState() =>
      _TempRequestApprovalCardState();
}

class _TempRequestApprovalCardState extends State<TempRequestApprovalCard> {
  Color kIconColor = Colors.blueAccent;
  int kIconSize = 12;

  @override
  Widget build(BuildContext context) {
    print(widget.id);
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
          Text(
            DateTime.fromMillisecondsSinceEpoch(int.parse(widget.time))
                .toString()
                .substring(0, 16),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: kIconColor,
              ),
              Text(
                " : ${widget.name}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.email,
                color: kIconColor,
              ),
              Text(
                " : ${widget.email}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ReadMoreText(
                  widget.message,
                  style: AppTheme.kHeadingContentStyleForAboutSection,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' read more',
                  trimExpandedText: ' read less',
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              buildApproveDenyButton('Approve', () async {
                print("Approve Request");
                widget.callback();
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
