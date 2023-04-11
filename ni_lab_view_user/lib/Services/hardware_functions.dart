import 'package:ni_lab_view_user/Services/request_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Door {
  Future lockDoor() async {
    final data =
        await RequestHelper().request(endPoint: '/user/lockDoor', bodyMap: {
      "user_id": FirebaseAuth.instance.currentUser!.uid,
      "user_name": FirebaseAuth.instance.currentUser!.displayName,
      "user_email": FirebaseAuth.instance.currentUser!.email,
    });
    if (data != null) {
      print(data);
    }
    return null;
  }

  Future unlockDoor() async {
    final data =
        await RequestHelper().request(endPoint: '/user/unlockDoor', bodyMap: {
      "user_id": FirebaseAuth.instance.currentUser!.uid,
      "user_name": FirebaseAuth.instance.currentUser!.displayName,
      "user_email": FirebaseAuth.instance.currentUser!.email,
    });
    if (data != null) {
      print(data);
    }
    return null;
  }
}
