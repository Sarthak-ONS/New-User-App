import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../app_colors.dart';

class NoticeListCard extends StatefulWidget {
  final String? noticeID;
  final String? noticeTitle;
  final String? noticeBody;
  final String? noticeImage;
  final DateTime? date;
  const NoticeListCard({
    Key? key,
    required this.noticeID,
    required this.noticeTitle,
    required this.noticeBody,
    required this.date,
    this.noticeImage,
  }) : super(key: key);

  @override
  State<NoticeListCard> createState() => _NoticeListCardState();
}

class _NoticeListCardState extends State<NoticeListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/notificationScreen',
          arguments: [
            widget.noticeID,
            widget.noticeTitle,
            widget.noticeBody,
            widget.noticeImage,
            widget.date,
          ],
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors
              .cardsArray[Random().nextInt(AppColors.cardsArray.length)],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.last_page,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateFormat.yMMMMd().format(widget.date!).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
                widget.noticeImage == null
                    ? Container()
                    : const Icon(
                        Icons.attachment,
                        color: Colors.black54,
                        size: 18,
                      )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.noticeTitle!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.noticeBody!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: 'PoppinsRegular',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
