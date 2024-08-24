import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laudney_frontend/Presentation/User/Home/user_home_screen.dart';
import 'package:laudney_frontend/Presentation/User/Order%20Detail/order_detail_screen.dart';

class UserOrderSection extends StatelessWidget {
  const UserOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          // shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => homeIndex.value = 0,
                    icon: const Icon(CupertinoIcons.back)),
                Text(
                  'My Orders',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 250,
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
                      // child: ,
                      //status
                      //price
                      //date
                      //delivery Date

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
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Service",
                          //       style: Theme.of(context).textTheme.bodyLarge,
                          //     ),
                          //     Text(
                          //       "Ironing",
                          //       style: Theme.of(context).textTheme.bodyLarge,
                          //     ),
                          //   ],
                          // ),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const UserOrderDetailScreen()));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "More",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Icon(CupertinoIcons.forward)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
