import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constants/size.dart';

class ConformItemWidget extends StatefulWidget {
  const ConformItemWidget({super.key});

  @override
  State<ConformItemWidget> createState() => _ConformItemWidgetState();
}

class _ConformItemWidgetState extends State<ConformItemWidget> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                  'assets/image/ironing_service.webp',
                  height: 75,
                  width: 75,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Ironing',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '18 Items',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '1500/-',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: RotatedBox(
                  quarterTurns: show ? 3 : 1,
                  child: const Icon(
                    CupertinoIcons.forward,
                  ),
                ),
              ),
            ],
          ),
          h10,
          AnimatedCrossFade(
            firstCurve: Curves.ease,
            secondCurve: Curves.easeInOut,
            firstChild: Container(
              // margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    // color: const Color.fromARGB(255, 215, 215, 215),
                    ),
              ),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: Random().nextInt(10) + 1,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //index and item name
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${index + 1})'),
                              w10,
                              const Text('Saree'),
                            ],
                          ),

                          const Text('10'),
                          const Text('100/-'),
                          Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            ),
            secondChild: const SizedBox(),
            crossFadeState:
                show ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }
}
