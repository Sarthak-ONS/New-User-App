import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key, required this.photoUrl}) : super(key: key);

  final String photoUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 52,
      backgroundColor: const Color(0xff20346C),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          photoUrl,
        ),
        onBackgroundImageError: (x, y) {
          if (kDebugMode) {
            print(x);
            print(y);
          }
        },
      ),
    );
  }
}
