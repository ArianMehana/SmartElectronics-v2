import 'package:e_commerce_v2/models/productModel.dart';

class Cart {
  final product products;
  final int itemNumber;

  Cart({required this.products, required this.itemNumber});
}

List<Cart> testCart = [
  Cart(products: demoProducts[2], itemNumber: 2),
  Cart(products: demoProducts[0], itemNumber: 1),
  Cart(products: demoProducts[3], itemNumber: 1)
];