import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle? textStyle;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

