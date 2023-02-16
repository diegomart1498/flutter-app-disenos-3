import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/shoe_model.dart';
import 'package:shoes_app/pages/shoe_desc_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool? fullScreen;
  const ShoeSizePreview({
    Key? key,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: (fullScreen!) ? 5 : 30,
        vertical: 5,
      ),
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
        color: const Color(0xffFFCF53),
        borderRadius: (!fullScreen!)
            ? BorderRadius.circular(50)
            : const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(33),
                topRight: Radius.circular(33),
              ),
      ),
      child: Column(
        children: [
          _ShoeWithShadow(fullScreen: fullScreen),
          if (!fullScreen!) const SizedBox(height: 20),
          if (!fullScreen!) const _ShoeSizes(),
        ],
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  final bool? fullScreen;
  const _ShoeWithShadow({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () {
        if (!fullScreen!) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoeDescPage(),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Stack(
          children: [
            //* Sombra del zapato
            const _ShoeShadow(),

            //* Imagen del zapato
            Image(image: AssetImage(shoeModel.assetImage)),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _ShoeSizeCard(7),
          _ShoeSizeCard(7.5),
          _ShoeSizeCard(8),
          _ShoeSizeCard(8.5),
          _ShoeSizeCard(9),
          _ShoeSizeCard(9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeCard extends StatelessWidget {
  final double talla;
  const _ShoeSizeCard(this.talla);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    final double tallaSelect = shoeModel.talla;
    return GestureDetector(
      onTap: () {
        Provider.of<ShoeModel>(context, listen: false).talla = talla;
      },
      child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:
              (talla == tallaSelect) ? const Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            (talla == tallaSelect)
                ? const BoxShadow(
                    color: Color.fromARGB(255, 216, 124, 20),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                : const BoxShadow(),
          ],
        ),
        //*Envolver en Material y poner ese type quita el subrayado de texto al regresar
        child: Material(
          type: MaterialType.transparency,
          child: Text(
            talla.toString().replaceAll('.0', ''),
            style: TextStyle(
              color: (talla == tallaSelect)
                  ? Colors.white
                  : const Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 0,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          width: 230,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffEAA14E),
                blurRadius: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
