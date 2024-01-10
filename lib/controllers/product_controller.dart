import 'package:get/get.dart';
import 'package:shopify_variants/models/product.dart';

class ProductController extends GetxController {
  RxList<Product> products = [
    Product(id: 0, name: 'Product 1'),
    Product(id: 1, name: 'Product 2'),
    Product(id: 2, name: 'Product 3')
  ].obs;
}
