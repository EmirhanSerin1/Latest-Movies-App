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
                "https://randomuser.me/api/portraits/women/40.jpg"),
          ),
        ),

        // SizedBox(
        //   child: Row(
        //     children: [
        //       const Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: BuildProfilPhoto(75, 75),
        //       ),
        //      const SizedBox(width: 10),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           //fullname
        //           SizedBox(
        //             width: MediaQuery.of(context).size.width * 0.5,
        //             child:const Text(
        //               "Name",
        //               style: TextStyle(fontWeight: FontWeight.w500),
        //             ),
        //           ),
        //           //email,
        //           SizedBox(
        //             width: MediaQuery.of(context).size.width * 0.5,
        //             child:const Text(
        //               "email",
        //               style: TextStyle(color: Colors.grey, fontSize: 13),
        //             ),
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        // const SizedBox(height: 50),
      ],
    );
  }
}
