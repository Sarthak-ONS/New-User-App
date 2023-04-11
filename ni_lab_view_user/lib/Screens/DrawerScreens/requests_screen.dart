import 'package:flutter/material.dart';
import 'package:ni_lab_view_user/Screens/RequestApprovalScreens/permanent_verification_screen.dart';
import 'package:ni_lab_view_user/Screens/RequestApprovalScreens/temp_request_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  TextStyle kTabTextStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Requests',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.schedule_send,
                  color: Colors.black,
                ),
                text: "Temporary",
              ),
              Tab(
                icon: Icon(
                  Icons.mark_unread_chat_alt,
                  color: Colors.black,
                ),
                text: "Permanent",
              ),
            ],
            labelStyle: TextStyle(),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
          ),
        ),
        body: const TabBarView(
          children: [
            TempRequestApprovalScreen(),
            PermanentRequestApprovalScreen(),
          ],
        ),
      ),
    );
  }
}
