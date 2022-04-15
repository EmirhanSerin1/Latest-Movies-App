import 'package:flutter/material.dart';

class PopIcon extends StatelessWidget {
  const PopIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: const Color.fromARGB(255, 73, 71, 71).withOpacity(0.6),
        ),
        padding: const EdgeInsets.all(5),
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
