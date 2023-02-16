import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String titulo;
  final String descripcion;
  const ShoeDescription({
    Key? key,
    required this.titulo,
    required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            descripcion,
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.black54, height: 1.6),
          ),
        ],
      ),
    );
  }
}
