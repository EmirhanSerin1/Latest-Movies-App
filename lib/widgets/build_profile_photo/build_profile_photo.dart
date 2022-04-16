import 'package:flutter/material.dart';

class BuildProfilPhoto extends StatelessWidget {
  const BuildProfilPhoto({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  

  final double height, width;
  // final Widget widget;

  @override
  Widget build(BuildContext context) {
    // UserModel user =  Provider.of<Auth>(context, listen: false).user;
    // return StreamBuilder<QuerySnapshot>(
    //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
    //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     return InkWell(
    //       onTap: () {
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => widget));
    //         // print(sex.toString());
    //       },
    //       child: Container(
    //         height: height,
    //         width: width,
    //         decoration: BoxDecoration(
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.5),
    //               blurRadius: 5,
    //               spreadRadius: 3,
    //               offset: Offset(0, 3),
    //             ),
    //           ],
    //           color: Color(0xFFDBF0FF),
    //           shape: BoxShape.circle,
    //           image: DecorationImage(
    //             image: user.sex == "Male"
    //                 ? AssetImage("assets/user/personM.png")
    //                 : AssetImage("assets/user/personF.png"),
    //             fit: BoxFit.contain,
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 3,
            offset:const Offset(0, 3),
          ),
        ],
        color: const Color(0xFFDBF0FF),
        shape: BoxShape.circle,
        // image: DecorationImage(
        //   image: user.sex == "Male"
        //       ? AssetImage("assets/user/personM.png")
        //       : AssetImage("assets/user/personF.png"),
        //   fit: BoxFit.contain,
        // ),
      ),
    );
  }
}
