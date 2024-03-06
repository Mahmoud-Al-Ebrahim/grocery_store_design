import 'package:cart_animation/Components/fav_btn.dart';
import 'package:cart_animation/Components/price.dart';
import 'package:cart_animation/Models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.product.title!,
              child: Image.asset(widget.product.image!),
            ),
            Text(
              widget.product.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Fruits",
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(amount: "20.00"),
                InkWell(
                    onTap: () {
                      setState(() {
                        favorites.contains(widget.product)
                            ? favorites.remove(widget.product)
                            : favorites.add(widget.product);
                      });
                    },
                    child: FavBtn(
                      isFavorite: favorites.contains(widget.product),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
