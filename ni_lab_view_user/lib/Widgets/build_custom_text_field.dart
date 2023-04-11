import 'package:flutter/material.dart';

import '../app_colors.dart';

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

Container buildTextFormField(
    {TextEditingController? controller, String? hintText, bool? isObscure}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: TextFormField(
      scrollPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      controller: controller,
      keyboardType: hintText == "Mobile Number" || hintText == "Student Number"
          ? TextInputType.phone
          : null,
      obscureText: isObscure == null ? false : true,
      decoration: InputDecoration(
        hintText: hintText!,
        labelText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: const TextStyle(fontSize: 15),
    ),
  );
}
