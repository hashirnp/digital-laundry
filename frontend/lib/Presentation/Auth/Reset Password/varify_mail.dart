import 'package:flutter/material.dart';

import '../../../Core/Constants/size.dart';
import '../../Widgets/text_field.dart';

ValueNotifier<bool> emailScreen = ValueNotifier(true);

class VerifyEmailWidget extends StatefulWidget {
  const VerifyEmailWidget({super.key});

  @override
  State<VerifyEmailWidget> createState() => _VerifyEmailWidgetState();
}

class _VerifyEmailWidgetState extends State<VerifyEmailWidget>
    {
  final emailController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          h10,
          AuthTextField(
              controller: emailController, hint: "E-Mail", type: "email"),
          h10,
          ElevatedButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                emailScreen.value = !emailScreen.value;
                // emailScreen.notifyListeners();
              }
            },
            style: ElevatedButton.styleFrom(),
            child: const Text('Verify Email'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    // emailScreen.dispose();
    super.dispose();
  }
}
