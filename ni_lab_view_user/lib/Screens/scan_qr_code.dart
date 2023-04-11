import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScanQRCodeWidget extends StatefulWidget {
  const ScanQRCodeWidget({Key? key}) : super(key: key);

  @override
  State<ScanQRCodeWidget> createState() => _ScanQRCodeWidgetState();
}

class _ScanQRCodeWidgetState extends State<ScanQRCodeWidget> {
  var samarthData = "B1ta2zm0ZPji283db7fBadasdad";
  var sarthakData = "B1ta2zm0ZPji283db7fB";

  final qrkey = GlobalKey(debugLabel: 'QRSCANNER');

  // QRViewController? controller;

  createMapForQRData() {
    Map<String, dynamic> mp = {
      "user_id": FirebaseAuth.instance.currentUser!.uid,
      "is_registered": true,
      "scanned_at": "${DateTime.now().toUtc()}"
    };
    final finalData = jsonEncode(mp);
    print(finalData);
    return finalData.toString();
  }

  @override
  void dispose() {
    // controller!.dispose();
    super.dispose();
  }

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  Barcode? data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    print("${userId}_true_${DateTime.now().toUtc()}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR to Enter Lab'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildQRCode(data: '${userId}_true_${DateTime.now().toUtc()}'),
            const Text('Sarthak Agarwal'),
          ],
        ),
      ),
    );
  }
}

class BuildQRCode extends StatelessWidget {
  const BuildQRCode({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8.0),
      child: QrImage(
        data: data,
        version: 3,
        backgroundColor: Colors.white,
        gapless: true,
        size: 300.0,
        dataModuleStyle: const QrDataModuleStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}


// "user_id":"48765486466845631","is_registered":true,"scanned_at":"2023-03-30 16:33:02.534417"