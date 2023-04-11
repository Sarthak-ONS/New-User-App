import 'package:flutter/material.dart';

import '../../Services/fireabase_api.dart';
import '../../Widgets/build_custom_primary_button.dart';
import '../../Widgets/build_custom_text_field.dart';
import '../../app_colors.dart';

class AddNoticeScreen extends StatefulWidget {
  const AddNoticeScreen({Key? key}) : super(key: key);

  @override
  State<AddNoticeScreen> createState() => _AddNoticeScreenState();
}

class _AddNoticeScreenState extends State<AddNoticeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nameController;
  TextEditingController? _bodyController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _bodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _bodyController!.dispose();
    _nameController!.dispose();
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
          'Add Notice',
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
                    'Please share your thoughts!',
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
                  hintText: "Title",
                ),
                buildTextFormField(
                  controller: _bodyController,
                  hintText: "Body",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomButton(
                    title: "Publish",
                    callback: () async {
                      print("Publishing");
                      await FirebaseApi()
                          .addNotice(
                            title: _nameController!.text,
                            body: _bodyController!.text,
                          )
                          .then((value) => Navigator.pop(context));
                    },
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
