import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ni_lab_view_user/Services/fireabase_api.dart';
import 'package:ni_lab_view_user/Widgets/show_error_snackbar.dart';

class FirebaseAuthApi {
  final _firebaseAuth = FirebaseAuth.instance;

  User get user => _firebaseAuth.currentUser!;

  Future login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showErrorSnackBar(context, "Email does not exist");
      }
      if (e.code == "wrong-password") {
        showErrorSnackBar(context, "Wrong Password");
      }
      if (e.code == "invalid-email") {
        showErrorSnackBar(context, "Invalid email");
      }
    } catch (e) {
      print(e);
    }
  }

  Future signup(
      {required String email,
      required String name,
      required String mobNo,
      required String branch,
      required String stNo,
      required BuildContext context}) async {
    try {
      showWaitingPopup(context);
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: "NiLabViewDefaut@201009",
      );
      print(userCredential.user!.uid);
      await userCredential.user!.updateDisplayName(name);
      await FirebaseApi().saveUserToDatabase(
          name: name,
          email: email,
          mobNo: mobNo,
          branch: branch,
          stNo: stNo,
          uid: userCredential.user!.uid);
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showErrorSnackBar(context, "Email already registered!");
      }
      if (e.code == "invalid-email") {
        showErrorSnackBar(context, "Invalid Email!");
      }
      if (e.code == "email-already-in-use") {
        showErrorSnackBar(context, "Email already registered!");
      }
    } catch (e) {
      print(e);
    }
  }

  Future signout(context) async {
    try {
      await _firebaseAuth.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (e) {
      print(e);
    }
  }
}
