import 'package:flutter/material.dart';

class BotonTexto extends StatelessWidget {
  const BotonTexto({
    super.key,
    required this.icono,
    required this.texto,
  });

  final IconData icono;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            icono,
            color: Colors.white,
            size: 35,
          ),
        ),
        Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
