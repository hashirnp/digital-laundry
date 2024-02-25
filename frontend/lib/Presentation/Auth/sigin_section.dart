import 'package:flutter/material.dart';
import 'package:laudney_frontend/Presentation/Auth/Reset%20Password/forget_screen.dart';
import 'package:laudney_frontend/Presentation/Home/Staff/staff_home_screen.dart';

import '../../Core/Constants/size.dart';
import '../Widgets/text_field.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: key,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          h10,
          AuthTextField(
              controller: emailController, hint: 'E-Mail', type: "email"),
          h10,
          AuthTextField(
              controller: passwordController, hint: 'Password', type: "pass"),
          // h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.white),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.blueGrey.withOpacity(
                                0.2,
                              )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                      side: MaterialStateProperty.all(const BorderSide(
                          // color: Colors.blue,
                          ))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgetScreen()));
                  },
                  child: const Text('Forget Password?'))
            ],
          ),
          h10,
          ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => const StaffHomeScreen()));
                }
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
