import 'package:flutter/material.dart';

import '../theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryClr,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      )
      );
  }
}
