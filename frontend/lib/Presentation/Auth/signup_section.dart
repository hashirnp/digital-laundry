import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:laudney_frontend/Core/Location/location.dart';

import '../../Core/Constants/size.dart';
import '../Widgets/text_field.dart';

ValueNotifier<bool> isAdmin = ValueNotifier(false);
ValueNotifier<List<double>> coordinates = ValueNotifier([]);

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
          h10,

          ValueListenableBuilder(
              valueListenable: coordinates,
              builder: (context, list, _) {
                return TextButton(
                    onPressed: () async {
                      var pos = await LocationClass().determinePosition();
                      coordinates.value.clear();
                      coordinates.value.add(pos.latitude);
                      coordinates.value.add(pos.longitude);

                      log(pos.toString());
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Coordinates Added')));
                      }
                    },
                    child: Row(
                      children: [
                        const Text('Add Location Coordinates '),
                        Text(list.length >= 2 ? "- Added" : "")
                      ],
                    ));
              }),
          h10, h10,
          ElevatedButton(
              onPressed: () {
                if (coordinates.value.length < 2) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add Location')));
                }
                if (key.currentState!.validate()) {}
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
