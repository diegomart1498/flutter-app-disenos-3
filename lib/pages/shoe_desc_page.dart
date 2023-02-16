import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/models/shoe_model.dart';
import 'package:shoes_app/widgets/custom_widgets.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1',
                child: ShoeSizePreview(fullScreen: true),
              ),
              Positioned(
                top: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  ShoeDescription(
                      titulo: 'Nike Air Max 720',
                      descripcion:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                  // ShoeSizePreview(),
                  _BuyNowButton(),
                  _ColorsAndMore(),
                  _BottomButtons(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BuyNowButton extends StatelessWidget {
  const _BuyNowButton();

  @override
  Widget build(BuildContext context) {
    double monto = 180;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(bottom: 10),
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
          Bounce(
            from: 12,
            delay: const Duration(milliseconds: 500),
            child: const OrangeButton(texto: 'Buy now'),
          ),
        ],
      ),
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 105,
                  child: _ColorButton(
                    color: Color(0xffC6D642),
                    index: 4,
                    asset: 'assets/verde.png',
                  ),
                ),
                Positioned(
                  left: 70,
                  child: _ColorButton(
                    color: Color(0xffFFAD29),
                    index: 3,
                    asset: 'assets/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 35,
                  child: _ColorButton(
                    color: Color(0xff2099F1),
                    index: 2,
                    asset: 'assets/azul.png',
                  ),
                ),
                Positioned(
                  child: _ColorButton(
                    color: Color(0xff364D56),
                    index: 1,
                    asset: 'assets/negro.png',
                  ),
                ),
              ],
            ),
          ),
          const OrangeButton(texto: 'More related items', grosor: 0),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final String asset;
  final int? index;
  const _ColorButton({
    required this.color,
    required this.asset,
    this.index = 1,
  });

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index! * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          shoeModel.assetImage = asset;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomButton(icon: Icons.favorite, color: Colors.pink),
          _BottomButton(icon: Icons.shopping_cart),
          _BottomButton(icon: Icons.settings),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  const _BottomButton({
    required this.icon,
    this.color = Colors.black45,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.white,
      elevation: 2,
      shape: const CircleBorder(),
      visualDensity: const VisualDensity(horizontal: 3, vertical: 3),
      child: Icon(icon, size: 30, color: color),
    );
  }
}
