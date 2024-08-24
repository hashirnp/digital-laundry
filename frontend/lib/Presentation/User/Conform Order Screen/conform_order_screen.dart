import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laudney_frontend/Presentation/User/Conform%20Order%20Screen/Widgets/conform_items.dart';

class ConformOrderScreen extends StatelessWidget {
  const ConformOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm Order',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Items",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      //showing categories
                      //then each items

                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10, //Random().nextInt(10) + 10,
                          itemBuilder: (context, index) {
                            return const ConformItemWidget();
                          })
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Change Address"))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10, bottom: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            )),
                        child: Text(
                          "Hashir\nNambudi Parambath, Kundoor, Nanambra, Malappuram, 676320",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                "Place Order",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      )),
    );
  }
}
