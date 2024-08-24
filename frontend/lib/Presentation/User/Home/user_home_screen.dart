import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laudney_frontend/Presentation/User/Add%20Order%20Screen/add_order_screen.dart';
import 'package:laudney_frontend/Presentation/User/Home/user_home.dart';
import 'package:laudney_frontend/Presentation/User/Home/user_orders.dart';
import 'package:laudney_frontend/Presentation/Settings/settings_section.dart';

ValueNotifier<int> homeIndex = ValueNotifier(0);

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  final screenList = const [
    StaffHomeSection(),
    UserOrderSection(),
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
            floatingActionButton: pos == 1
                ? FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddOrderScreen()));
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(
                      CupertinoIcons.add,
                    ),
                  )
                : null,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: pos,
              items: [
                BottomNavigationBarItem(
                    icon: pos == 0
                        ? const Icon(CupertinoIcons.house_fill)
                        : const Icon(CupertinoIcons.home),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: pos == 1
                        ? const Icon(CupertinoIcons.cube_box_fill)
                        : const Icon(CupertinoIcons.cube_box),
                    label: 'Orders'),
                BottomNavigationBarItem(
                    icon: pos == 2
                        ? const Icon(CupertinoIcons.settings_solid)
                        : const Icon(CupertinoIcons.settings),
                    label: 'Settings')
              ],
              elevation: 0,
              onTap: (pos) {
                homeIndex.value = pos;
              },
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).splashColor,
            ),
            body: screenList[pos],
          );
        });
  }
}
