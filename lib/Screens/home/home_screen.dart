
import 'package:cart_animation/Controllers/home_controller.dart';
import 'package:cart_animation/Details/details_screen.dart';
import 'package:cart_animation/Models/Product.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'components/header.dart';
import 'components/product_card.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xFFEAEAEA),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          top: controller.homeState == HomeState.normal
                              ? headerHeight
                              : -(constraints.maxHeight -
                                  barHeight * 2 -
                                  headerHeight),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight -
                              headerHeight -
                              barHeight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(defaultPadding * 1.5),
                                bottomRight:
                                    Radius.circular(defaultPadding * 1.5),
                              ),
                            ),
                            child: GridView.builder(
                              itemCount: products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: defaultPadding,
                                crossAxisSpacing: defaultPadding,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                product: products[index],
                                press: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailsScreen(
                                          product: products[index],
                                          onProductAdd: () {
                                            controller.addProductToCart(
                                                products[index]);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        // Card Panel
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal
                              ? barHeight
                              : (constraints.maxHeight - barHeight),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              color: Color(0xFFEAEAEA),
                              alignment: Alignment.topLeft,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: controller.homeState == HomeState.normal
                                    ? CardShortView(controller: controller)
                                    : CartDetailsView(controller: controller),
                              ),
                            ),
                          ),
                        ),
                        // Header
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          top: controller.homeState == HomeState.normal
                              ? 0
                              : -headerHeight,
                          right: 0,
                          left: 0,
                          height: headerHeight,
                          child: HomeHeader(),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
