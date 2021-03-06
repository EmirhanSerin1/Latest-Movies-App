import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_top.dart';
import '../widgets/drawer/log_out.dart';
import '../widgets/drawer/menu_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: SafeArea(
          child: ListView(
            children: const [
              DrawerTop(),
              MenuItem(icon: Icons.account_circle, text: "My Account"),
              // Divider(),
              MenuItem(icon: Icons.settings, text: "Settings"),
              Divider(),
              // Spacer(),
              LogOut(),
            ],
          ),
        ),
      ),
    );
  }
}
