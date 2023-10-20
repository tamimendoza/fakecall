import 'package:flutter/material.dart';

class BotonCircular extends StatelessWidget {
  const BotonCircular({
    super.key,
    required this.icono,
    required this.iconSize,
    required this.backgroundColor,
    required this.onPressed,
  });

  final IconData icono;
  final double iconSize;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(25),
        backgroundColor: backgroundColor,
      ),
      onPressed: () => onPressed(),
      child: Icon(
        icono,
        size: iconSize,
        color: Colors.white,
      ),
    );
  }
}
