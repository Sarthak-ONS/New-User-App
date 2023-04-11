import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ni_lab_view_user/Services/request_helper.dart';

class FirebaseApi {
  final _firebase = FirebaseFirestore.instance;

  Future checkAdmin({required String userId}) async {
    try {
      final DocumentSnapshot snapshot =
          await _firebase.collection('Users').doc(userId).get();
      bool isVerifiedFromAdmin = snapshot.get("isVerifiedFromAdmin");
      print(isVerifiedFromAdmin);
    } catch (e) {
      print(e);
    }
  }

  Future saveUserToDatabase(
      {required String name,
      required String email,
      required String mobNo,
      required String branch,
      required String stNo,
      required String uid}) async {
    print("STARTED SAVING USER TO DATABASE!");
    try {
      final ref = await _firebase.collection('Users').doc(uid).set({
        "Name": name,
        "Email": email,
        "MobileNo": mobNo,
        "Branch": branch,
        "StudentNo": stNo,
        "ContactNo": mobNo,
        "isAdmin": false,
        "isVerifiedFromAdmin": false,
        "UniqueID": ""
      });
      await _firebase.collection('Users').doc(uid).update({"UniqueID": uid});
    } catch (e) {
      print(e);
    }
  }

  Future deleteTempRequest(String id) async {
    try {
      await _firebase.collection('NewAdminRequests').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future approvePermanentVerification(
      String id, String name, String email) async {
    try {
      await _firebase.collection('Users').doc(id).update({
        "isVerifiedFromAdmin": true,
      });

      await RequestHelper().request(endPoint: '/admin/sendEmail', bodyMap: {
        "name": name,
        "email": email,
      });
    } catch (e) {
      print(e);
    }
  }

  Future addNotice({required String title, required String body}) async {
    try {
      await _firebase.collection('Notices').add({
        "noticeTitle": title,
        "noticeBody": body,
        "noticeImage": "",
        "noticeDate": DateTime.now(),
        "noticeID": ""
      });
    } catch (e) {
      print(e);
    }
  }
}
