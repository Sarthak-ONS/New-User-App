import 'package:flutter/material.dart';
import 'package:ni_lab_view_user/Services/firebase_auth_api.dart';

class LogoutWidgetClass {
  static openLogoutDialogue(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure you want to Logout?'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    FirebaseAuthApi().signout(context);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
