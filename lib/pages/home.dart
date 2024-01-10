// This page is used to show the different products available.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/product_controller.dart';
import 'package:shopify_variants/widgets/product_card.dart';

class Home extends GetView<ProductController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: controller.products
                .map((product) => ProductCard(
                      product: product,
                    ))
                .toList()),
      ),
    );
  }
}
