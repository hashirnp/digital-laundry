import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Core/Constants/size.dart';
import '../Widgets/text_field.dart';

ValueNotifier<bool> isAdmin = ValueNotifier(false);

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final addressController = TextEditingController();
    final mobileController = TextEditingController();
    final nameController = TextEditingController();
    return Form(
      key: key,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          //fullname, address, phone, email, password
          h10,
          AuthTextField(
              controller: nameController, hint: 'Full Name', type: "name"),
          h10,
          AuthTextField(
              controller: mobileController, hint: 'Mobile', type: "mobile"),
          h10,
          AuthTextField(
              controller: addressController, hint: 'Address', type: "address"),
          h10,
          AuthTextField(
              controller: emailController, hint: 'E-Mail', type: "email"),
          h10,
          AuthTextField(
              controller: passwordController, hint: 'Password', type: "pass"),
          // h10,

          ValueListenableBuilder(
              valueListenable: isAdmin,
              builder: (context, val, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Admin'),
                    Switch.adaptive(
                        activeColor: Theme.of(context).primaryColor,
                        inactiveThumbColor: Theme.of(context).primaryColor,
                        inactiveTrackColor: Colors.black,
                        value: val,
                        onChanged: (newVal) {
                          isAdmin.value = newVal;
                        })
                  ],
                );
              }),
          h10, h10,
          ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {}
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
