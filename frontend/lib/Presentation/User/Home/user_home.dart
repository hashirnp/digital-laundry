
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Core/Constants/size.dart';

class StaffHomeSection extends StatelessWidget {
  const StaffHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  scale: 1,
                                  image:
                                      AssetImage('assets/image/vector.jpg'))),
                        ),
                        w10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hashir',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.locationDot,
                                ),
                                w10,
                                Text(
                                  'Kundoor',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          )),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.bell)),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10, top: 10, bottom: 0),
              child: Text(
                "Welcome to Digital Laundry",
                style: Theme.of(context).textTheme.displayLarge,
              )),
          Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  10,
                )),
          ),

          //service
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hot Services',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/image/ironing_service.webp"))),
                            // child: Image.asset(
                            //   "assets/image/ironing_service.webp",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          const Text('Service Name')
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return w10;
                    },
                  ),
                )
              ],
            ),
          ),


          //most used

          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Most Used Services',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/image/ironing_service.webp"))),
                            // child: Image.asset(
                            //   "assets/image/ironing_service.webp",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          const Text('Service Name')
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return w10;
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
