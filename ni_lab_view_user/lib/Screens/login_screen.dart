import 'package:flutter/material.dart';
import 'package:ni_lab_view_user/Services/firebase_auth_api.dart';
import 'package:ni_lab_view_user/Widgets/build_custom_primary_button.dart';

import '../../Widgets/build_custom_text_field.dart';
import '../../app_colors.dart';
import '../Widgets/show_error_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _messageController;

  var isChecked = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _nameController!.dispose();
    _messageController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'NI LabView',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'Transforming the skill landscape.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w300,
                    //fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextFormField(
              controller: _emailController,
              hintText: "Your Email",
            ),
            buildTextFormField(
              controller: _passwordController,
              hintText: "Password",
              isObscure: true,
            ),
            CustomButton(
                title: 'Login',
                callback: () async {
                  FocusManager.instance.primaryFocus?.unfocus();

                  if (_emailController!.text.isEmpty ||
                      _passwordController!.text.isEmpty) {
                    showErrorSnackBar(context, 'Please enter all details');
                  }

                  await FirebaseAuthApi().login(
                    email: _emailController!.text,
                    password: _passwordController!.text,
                    context: context,
                  );
                }),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text(
                'Not registered? Signup',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
