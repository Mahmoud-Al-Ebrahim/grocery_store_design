import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class FavBtn extends StatelessWidget {
  const FavBtn({
    Key? key,
    required this.isFavorite,
    this.radius = 15,
  }) : super(key: key);
  final isFavorite;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xFFE3E2E3),
      child: SvgPicture.asset(
        "assets/icons/heart.svg",
        color: isFavorite ? primaryColor : null,
      ),
    );
  }
}
