import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.type,
  });

  final TextEditingController controller;
  final String hint;
  final String type;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction:
          widget.type == "pass" ? TextInputAction.done : TextInputAction.next,
      controller: widget.controller,
      obscureText: widget.type == "pass",
      validator: (val) {
        switch (widget.type) {
          case "email":
            final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!);
            if (val.isEmpty) {
              return 'Enter Email';
            } else if (!emailValid) {
              return 'Invalid Email';
            }

            // return null;

            break;

          case "name":
            if (val!.isEmpty) {
              return 'Enter Name';
            }
            break;

          case "mobile":
            if (val!.isEmpty) {
              return 'Enter Mobile Number';
            } else if (val.length != 10) {
              return 'mobile number should be 10 digits';
            }
            break;

          case "address":
            if (val!.isEmpty) {
              return 'Enter Address';
            }
            break;
          case "pass":
            if (val!.isEmpty) {
              return 'Enter Password';
            }

            if (val.length != 8) {
              return 'Password should be 8 Charecters';
            }
            break;

          default:
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
        labelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
        label: Text(widget.hint),
        contentPadding: const EdgeInsets.all(10),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.red,
        //   ),
        // ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.blueGrey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
