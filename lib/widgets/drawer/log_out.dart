import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_drawer.dart';
import 'package:latest_movies_app/widgets/drawer/log_out_alert_dialog.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // ListTile(
        //   onTap: () {},
        //   title: Text("Logout"),
        //   leading: Icon(Icons.logout),
        // );
        Container(
      margin: PaddingMenuItem.margin,
      padding: PaddingMenuItem.padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 114, 64, 64),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 3,
              color: Colors.red.withOpacity(0.4),
              offset: const Offset(0, 0),
            )
          ]),
      height: 50,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Log Out"),
            InkWell(
              onTap: () => showAlertdialog(context),
              child: const Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
