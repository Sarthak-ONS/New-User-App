import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen_notice_card.dart';

class NoticeList extends StatefulWidget {
  const NoticeList({Key? key}) : super(key: key);

  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<Object>(
        future: FirebaseFirestore.instance
            .collection('Notices')
            .orderBy('noticeDate', descending: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Please try again later'),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.start,
            itemBuilder: ((context, index) {
              DateTime datetime =
                  snapshot.data.docs[index]['noticeDate'].toDate();
              return NoticeListCard(
                noticeID: snapshot.data.docs[index]['noticeID'],
                noticeBody: snapshot.data.docs[index]['noticeBody'],
                noticeTitle: snapshot.data.docs[index]['noticeTitle'],
                noticeImage: snapshot.data.docs[index]['noticeImage'],
                date: datetime,
              );
            }),
            itemCount: snapshot.data.docs.length,
          );
        },
      ),
    );
  }
}
