import 'package:flutter/material.dart';

class RoundedIconWithBackground extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color color;
  final void Function()? onPressed;
  final EdgeInsets margin;
  const RoundedIconWithBackground({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.color,
    this.onPressed,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: margin.left,
          right: margin.right,
          top: margin.top,
          bottom: margin.bottom),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
