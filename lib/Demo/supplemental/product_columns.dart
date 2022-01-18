import 'package:flutter/material.dart';

import 'package:demo_2_flutter/Demo/model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  const TwoProductCardColumn({Key? key, required this.bottom, this.top})
      : super(key: key);

  final Product bottom;
  final Product? top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const spaceHeight = 44.0;

        double heightOfCards = (constraints.biggest.height - spaceHeight) / 2.0;
        double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;

        double imageAspectRatio = heightOfImages >= 0.0
            ? constraints.biggest.width / heightOfImages
            : 49.0 / 33.0;

        return ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0),
              child: top != null
                  ? ProductCard(
                      imageAspectRatio: imageAspectRatio,
                      product: top!,
                    )
                  : SizedBox(
                      height: heightOfCards,
                    ),
            ),
            const SizedBox(height: spaceHeight),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 28.0),
              child: ProductCard(
                imageAspectRatio: imageAspectRatio,
                product: bottom,
              ),
            ),
          ],
        );
      },
    );
  }
}

class OneProductCardColumn extends StatelessWidget {
  const OneProductCardColumn({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      children: <Widget>[
        const SizedBox(
          height: 40.0,
        ),
        ProductCard(
          product: product,
        ),
      ],
    );
  }
}
