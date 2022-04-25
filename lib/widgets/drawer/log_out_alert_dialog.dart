import 'package:flutter/material.dart';

class LogOutAlertDialog extends StatelessWidget {
  const LogOutAlertDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAlertdialog(context);
  }
}

showAlertdialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content:
            const Text('Are you sure you want to sign out of your account?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context), //logout(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
