import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: InkWell(
            onTap: () {
              Get.toNamed('/options');
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Product 1',
                  style: TextStyle(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
