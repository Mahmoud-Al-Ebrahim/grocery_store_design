import 'package:cart_animation/Models/Product.dart';

class ProductItem{

 final Product? product;
   int quantity;

 ProductItem({this.product,this.quantity=1});

 void increment()
 {
   quantity++;
 }
}