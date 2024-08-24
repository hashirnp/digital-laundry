import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laudney_frontend/Presentation/User/Conform%20Order%20Screen/conform_order_screen.dart';

import '../../../Core/Constants/size.dart';

class AddOrderScreen extends StatelessWidget {
  const AddOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Orders',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.back)),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ConformOrderScreen()));
        },
        child: const Icon(
          CupertinoIcons.forward,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: key,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              // shrinkWrap: true,
              // physics: const BouncingScrollPhysics(),
              children: [
                //loading categories
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: Random().nextInt(10) + 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/image/ironing_service.webp',
                                fit: BoxFit.contain,
                                height: 100,
                                // width: 100,
                              ),
                              Text(
                                'Ironing',
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            ],
                          ),
                        );
                      }),
                ),

                //load items
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                        itemCount: Random().nextInt(10) + 4,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          int count = 0;
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/image/ironing_service.webp',
                                      fit: BoxFit.contain,
                                      height: 40,
                                      // width: 100,
                                    ),
                                    w10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Item Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        const Text("250/-")
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        CupertinoIcons.minus,
                                        size: 18,
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          "$count",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        CupertinoIcons.add,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
  user id
  servicecatID
  date
  pickupdate
  deliverydate = staff will add
  deliveryAddress (ask user address is ok, if not add new address for only current order.)
  status
  price
  paymentstatus
  order id
  list of service items
      {item id
      quantity}
*/
