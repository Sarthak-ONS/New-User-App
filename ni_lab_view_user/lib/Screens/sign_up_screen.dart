import 'package:flutter/material.dart';
import 'package:ni_lab_view_user/Services/firebase_auth_api.dart';
import 'package:ni_lab_view_user/Widgets/build_custom_primary_button.dart';
import 'package:ni_lab_view_user/Widgets/show_error_snackbar.dart';

import '../../Widgets/build_custom_text_field.dart';
import '../../app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _mobileNumberController;
  TextEditingController? _branchController;
  TextEditingController? _stNoController;

  var isChecked = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileNumberController = TextEditingController();
    _branchController = TextEditingController();
    _stNoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _nameController!.dispose();
    _branchController!.dispose();
    _mobileNumberController!.dispose();
    _stNoController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Signup',
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    'Hey there, Please fill this form to get registered!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                  controller: _nameController,
                  hintText: "Your Name",
                ),
                buildTextFormField(
                  controller: _emailController,
                  hintText: "Your Email",
                ),
                buildTextFormField(
                  controller: _mobileNumberController,
                  hintText: "Mobile Number",
                ),
                buildTextFormField(
                  controller: _branchController,
                  hintText: "Branch",
                ),
                buildTextFormField(
                  controller: _stNoController,
                  hintText: "Student Number",
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          if (value! == true) {
                            isChecked = true;
                          } else {
                            isChecked = false;
                          }
                          setState(() {});
                        },
                      ),
                      const Text('Are you enrolled in a NI Course?')
                    ],
                  ),
                ),
                CustomButton(
                  title: 'Signup',
                  callback: () async {
                    if (_branchController!.text.isEmpty ||
                        _nameController!.text.isEmpty ||
                        _mobileNumberController!.text.isEmpty ||
                        _branchController!.text.isEmpty ||
                        _stNoController!.text.isEmpty) {
                      showErrorSnackBar(context, 'Please enter all details');
                    }

                    await FirebaseAuthApi().signup(
                      email: _emailController!.text,
                      name: _nameController!.text,
                      mobNo: _mobileNumberController!.text,
                      branch: _branchController!.text,
                      stNo: _stNoController!.text,
                      context: context,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





//  Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       padding: MaterialStateProperty.all(
//                         const EdgeInsets.symmetric(vertical: 15),
//                       ),
//                       backgroundColor: MaterialStateProperty.all(
//                         Colors.orangeAccent,
//                       ),
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         print(_nameController!.text);
//                         print(_emailController!.text);
//                         print(_mobileNumberController!.text);
//                         print(_branchController!.text);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Processing Data')),
//                         );
//                       }
//                     },
//                     child: const Text(
//                       'Submit',
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   ),
//                 )