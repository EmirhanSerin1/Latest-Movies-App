import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  //? Drawer Menu Item
  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final String text;
  final IconData icon;
  // final Widget widget;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => widget));
        },
        child: Container(
          padding:const EdgeInsets.fromLTRB(8, 12, 8, 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black54,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.red.withOpacity(0.4),
                  offset: const Offset(0, 0),
                  spreadRadius: 3,
                )
              ]),
          child: Row(
            children: [
              Icon(
                icon,
                color:const Color(0xFFF3F3F3),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(color: Color(0xFFF3F3F3), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
