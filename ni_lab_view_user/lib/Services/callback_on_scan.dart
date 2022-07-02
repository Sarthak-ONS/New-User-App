import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class CallBackScanner {
  static callbackOnEnterLab(
      {required String data, required BuildContext context}) async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 300,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Scan this QR Code to enter Lab",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: const Color(0xff20346C), width: 2),
                ),
                child: QrImage(
                  data: data,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
