import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/build_profile_photo/build_profile_photo.dart';
import 'package:latest_movies_app/widgets/drawer/menu_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  buildTop(context),
                  
                  const MenuItem(icon: Icons.account_circle, text: "My Account"),
                  const MenuItem(icon: Icons.shopping_cart_outlined, text: "Shopping Cart"),
                  const MenuItem(icon: Icons.history, text: "Order History"),
                  const Divider(),
                  const MenuItem(icon: Icons.settings, text:"Settings"),
                  
                  
                  buildLogOutButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTop(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildProfilPhoto(75, 75),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //fullname
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    //email,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "email",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  
  buildLogOutButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 114, 64, 64),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Colors.red.withOpacity(0.3),
                offset: Offset(3, 3),
              )
            ]),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Log Out"),
              ),
              IconButton(
                  onPressed: () {
                    showAlertdialog();
                    // logout(context);
                  },
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  showAlertdialog() {
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
