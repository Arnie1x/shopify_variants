import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: InkWell(
              onTap: () {
                Get.toNamed('/options/${product.id}');
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
