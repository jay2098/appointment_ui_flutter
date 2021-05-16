import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final Color containerBackground;
  final Icon icon;
  final VoidCallback onTap;

  const SquareBox({Key key, this.containerBackground, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerBackground,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onTap,
      ),
    );
  }
}
