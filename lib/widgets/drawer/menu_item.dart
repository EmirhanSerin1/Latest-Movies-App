import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_drawer.dart';

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
    return InkWell(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        margin:  PaddingMenuItem.margin,
        padding: PaddingMenuItem.padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                offset: const Offset(0, 0),
                spreadRadius: 3,
              )
            ]),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
// TextStyle(
//                 color: Theme.of(context).iconTheme.color,
//                 fontWeight: FontWeight.w500,
//               ),
