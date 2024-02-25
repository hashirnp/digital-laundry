import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laudney_frontend/Presentation/Auth/Reset%20Password/reset_password.dart';

import 'varify_mail.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(CupertinoIcons.back)),
          title: Text(
            'Forgot Password',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: emailScreen,
              builder: (context, val, _) {
                return AnimatedCrossFade(
                    firstChild: const VerifyEmailWidget(),
                    secondChild: const ResetPasswordWidget(),
                    crossFadeState: val
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 1));
              }),
        ));
  }
}
