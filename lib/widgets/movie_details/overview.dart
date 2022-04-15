import 'package:flutter/material.dart';

class OverView extends StatelessWidget {
  const OverView({ Key? key, required this.text }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "OverView",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(text),
            ],
            
          ),
        );
  }
}