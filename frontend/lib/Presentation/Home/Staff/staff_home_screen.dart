import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laudney_frontend/Presentation/Home/Staff/staff_home.dart';
import 'package:laudney_frontend/Presentation/Home/Staff/staff_orders.dart';
import 'package:laudney_frontend/Presentation/Settings/settings_section.dart';

ValueNotifier<int> homeIndex = ValueNotifier(0);

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  final screenList = const [
    StaffHomeSection(),
    StaffOrderSection(),
    SettingsSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: homeIndex,
        builder: (context, pos, _) {
          return Scaffold(
            // appBar: AppBar(
            //   leading: const Icon(
            //     CupertinoIcons.home,
            //   ),
            //   title: const Text("Welcome Hashir!"),
            // ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: pos,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cube_box_fill), label: 'Orders'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings), label: 'Settings')
              ],
              elevation: 0,
              onTap: (pos) {
                homeIndex.value = pos;
              },
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedItemColor: Theme.of(context).primaryColor,
            ),
            body: screenList[pos],
          );
        });
  }
}
