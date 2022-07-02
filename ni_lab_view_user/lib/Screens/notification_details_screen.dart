import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({
    Key? key,
    this.noticeID,
    this.noticeTitle,
    this.noticeBody,
    this.noticeImage,
    this.noticeDate,
  }) : super(key: key);

  final String? noticeID;
  final String? noticeTitle;
  final String? noticeBody;
  final String? noticeImage;
  final DateTime? noticeDate;

  @override
  State<NoticeScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Notice',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.library_add,
                    color: Colors.orangeAccent,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Students',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              DateFormat.yMMMEd().format(widget.noticeDate!).toString(),
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.noticeTitle!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.noticeBody!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.noticeImage!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
