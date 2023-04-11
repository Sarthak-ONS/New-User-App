import 'package:flutter/material.dart';

import '../../Widgets/build_custom_text_field.dart';
import '../../app_colors.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _mobileNumberController;
  TextEditingController? _messageController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileNumberController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _nameController!.dispose();
    _messageController!.dispose();
    _mobileNumberController!.dispose();
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
          'NI LabView Help',
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
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    'Hey there, Please feel free to contact us.',
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
                  controller: _messageController,
                  hintText: "Message",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 15),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.orangeAccent,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(_nameController!.text);
                        print(_emailController!.text);
                        print(_mobileNumberController!.text);
                        print(_messageController!.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
