import 'package:flutter/material.dart';

import '../app_colors.dart';

showErrorSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
      ),
    ),
  );
  return;
}

showWaitingPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Center(
            child: Text(
              'Request Sent! You will get a mail when admin approves your request!',
            ),
          ),
        ],
      ),
    ),
  );
}

showLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
