import 'package:flutter/material.dart';
import 'package:laudney_frontend/Core/Constants/size.dart';
import 'package:laudney_frontend/Presentation/Auth/sigin_section.dart';
import 'package:laudney_frontend/Presentation/Auth/signup_section.dart';

ValueNotifier<bool> signInSection = ValueNotifier(true);

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: [
                    Text(
                      'Welcome ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                    Text(
                      'At your Service always ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: signInSection,
                  builder: (context, val, _) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              // top: MediaQuery.of(context).size.height * 0.11,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signInSection.value = !signInSection.value;
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Sign In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: val
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              w10,
                              GestureDetector(
                                onTap: () {
                                  signInSection.value = !signInSection.value;
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: val
                                            ? Colors.transparent
                                            : Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedCrossFade(
                            firstChild: const SignInSection(),
                            secondChild: const SignUpSection(),
                            crossFadeState: val
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 500))
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
