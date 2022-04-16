import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/build_profile_photo/build_profile_photo.dart';

class DrawerTop extends StatelessWidget {
  const DrawerTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://images.pexels.com/photos/3921000/pexels-photo-3921000.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            ),
          )),
          accountName: Text("Bessie Webb"),
          accountEmail: Text("bessie.webb@example.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://randomuser.me/api/portraits/women/40.jpg",
            ),
          ),
        ),
      ],
    );
  }
}
