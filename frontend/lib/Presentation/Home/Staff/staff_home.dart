import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly Status',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
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
