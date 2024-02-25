import 'package:flutter/material.dart';

import '../../../Core/Constants/size.dart';
import '../../Widgets/text_field.dart';
import 'varify_mail.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  final passController = TextEditingController();
  final passVerifyController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          h10,
          AuthTextField(
              controller: passController, hint: "Password", type: "pass"),
          h10,
          AuthTextField(
              controller: passVerifyController,
              hint: "Re Enter Password",
              type: "pass"),
          h10,
          ElevatedButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                emailScreen.value = !emailScreen.value;
              }
            },
            style: ElevatedButton.styleFrom(),
            child: const Text('Rest Password'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passController.dispose();
    passVerifyController.dispose();

    super.dispose();
  }
}
