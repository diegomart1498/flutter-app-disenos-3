import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
  const CustomAppBar({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 30),
        width: double.infinity,
        child: Row(
          children: [
            Text(texto,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            const Spacer(),
            const Icon(Icons.search, size: 30),
          ],
        ),
      ),
    );
  }
}
