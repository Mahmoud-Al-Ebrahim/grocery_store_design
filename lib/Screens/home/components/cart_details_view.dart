import 'package:cart_animation/Controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'cart_detailsview_card.dart';

class CartDetailsView extends StatefulWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  State<CartDetailsView> createState() => _CartDetailsViewState();
}

class _CartDetailsViewState extends State<CartDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            widget.controller.cart.length,
            (index) => CartDetailsViewCard(productItem: widget.controller.cart[index]),
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.controller.cart=[];
                });
              },
              child: Text("Next - \$30"),
            ),
          )
        ],
      ),
    );
  }
}
