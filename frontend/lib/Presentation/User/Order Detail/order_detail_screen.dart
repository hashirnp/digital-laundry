import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/Constants/size.dart';

ValueNotifier<bool> showItems = ValueNotifier(false);

class UserOrderDetailScreen extends StatelessWidget {
  const UserOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          // shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          children: [
            Row( 
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(CupertinoIcons.back)),
                Text(
                  "Order Detail",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/ironing_service.webp'),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color.fromARGB(255, 215, 215, 215),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "27-02-2024",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "250/-",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Date & Time",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Flexible(
                        child: Text(
                          "29-02-2024 10:30 PM",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            h10,
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: showItems,
                  builder: (context, show, _) {
                    return Column(
                      // shrinkWrap: true,
                      // scrollDirection: Axis.vertical,
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Items",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                showItems.value = !showItems.value;
                              },
                              icon: RotatedBox(
                                quarterTurns: show ? 3 : 1,
                                child: const Icon(
                                  CupertinoIcons.forward,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: AnimatedCrossFade(
                            firstCurve: Curves.ease,
                            secondCurve: Curves.easeInOut,
                            firstChild: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 215, 215, 215),
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
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                          const Text('Washing'),
                                          const Text('10'),
                                          const Text('100/-')
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            secondChild: const SizedBox(),
                            crossFadeState: show
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 500),
                            reverseDuration: const Duration(milliseconds: 500),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
