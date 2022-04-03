import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/drawer/log_out_alert_dialog.dart';

class LogOut extends StatelessWidget {
  const LogOut({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 114, 64, 64),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Colors.red.withOpacity(0.3),
                offset:const Offset(3, 3),
              )
            ]),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text("Log Out"),
              ),
              IconButton(
                  onPressed: () {
                    showAlertdialog(context);
                    // logout(context);
                  },
                  icon:const Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }

   // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut().then((value) =>
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => LoginScreen())));
  // }

  // get fullName => SizedBox(
  //       width: MediaQuery.of(context).size.width * 0.5,
  //       child: Text(
  //         FirebaseAuth.instance.currentUser?.displayName ?? "",
  //         style: TextStyle(fontWeight: FontWeight.w500),
  //       ),
  //     );

  // get email => SizedBox(
  //       width: MediaQuery.of(context).size.width * 0.5,
  //       child: Text(
  //         FirebaseAuth.instance.currentUser?.email ?? "no email",
  //         style: TextStyle(color: Colors.grey, fontSize: 13),
  //       ),
  //     );
}