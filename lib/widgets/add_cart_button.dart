import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final double monto;
  const AddToCartButton({Key? key, required this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Text(
              '\$$monto',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const OrangeButton(texto: 'Add to cart'),
          ],
        ),
      ),
    );
  }
}

class OrangeButton extends StatelessWidget {
  final String texto;
  final double? grosor;
  const OrangeButton({
    super.key,
    required this.texto,
    this.grosor = 3,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xffF1A23A),
      visualDensity: VisualDensity(vertical: grosor!, horizontal: grosor!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {},
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
