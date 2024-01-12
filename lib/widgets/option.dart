import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/product_controller.dart';

class Option extends StatelessWidget {
  final int productID;
  final int optionID;
  const Option({
    super.key,
    required this.optionID,
    required this.productID,
  });

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();
    var product = productController.products[productID];
    var key = product.options![optionID].keys.elementAt(0);
    var values = product.options![optionID].values.elementAt(0);

    if (product.options!.any((element) => element.isEmpty)) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            // IconButton(
            //   color: Theme.of(context).colorScheme.error,
            //   onPressed: () {
            //     product.options!.removeAt(optionID);
            //     product.options = product.options;
            //   },
            //   icon: const Icon(
            //     Icons.delete_rounded,
            //     size: 24,
            //   ),
            // )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: values.map((value) => Chip(label: Text(value))).toList(),
        ),
        const Divider(),
      ],
    );
  }
}
