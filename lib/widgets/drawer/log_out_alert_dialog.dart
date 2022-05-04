import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogOutAlertDialog extends StatelessWidget {
  const LogOutAlertDialog({Key? key}) : super(key: key);

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
      content: const Text('Are you sure you want to sign out of your account?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            final isSignedIn = await GoogleSignIn().isSignedIn();
            if (isSignedIn) await GoogleSignIn().signOut();
            Navigator.pop(context);
          }, //logout(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
