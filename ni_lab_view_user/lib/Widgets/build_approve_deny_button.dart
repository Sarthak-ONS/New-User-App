import 'package:flutter/material.dart';

Widget buildApproveDenyButton(
    String text, Function callback, Color primaryColor) {
  return TextButton.icon(
    icon: Icon(
      text == "Deny" ? Icons.cancel : Icons.check,
      color: Colors.white,
    ),
    onPressed: () {
      callback();
    },
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    ),
    label: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
