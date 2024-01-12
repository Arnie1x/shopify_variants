// This page is for displaying and creating the Product options and variants

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/product_controller.dart';
import 'package:shopify_variants/models/product.dart';
import 'package:shopify_variants/widgets/new_option_button.dart';
import 'package:shopify_variants/widgets/option.dart';
import 'package:shopify_variants/widgets/option_form.dart';
import 'package:shopify_variants/widgets/variants.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductController());
    var productController = Get.find<ProductController>();
    var id = int.parse(Get.parameters['id']!);
    Product product = productController.products[int.parse(id.toString())];
    var newOptionButton = NewOptionButton();
    var newOption = OptionForm(product: product);

    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: Obx(() {
          if (newOptionButton.newOption.value && newOption.done.value) {
            newOptionButton.newOption.value = false;
            newOption.done.value = false;
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Options',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Divider(),
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            itemCount: productController
                                    .products[id].options?.length ??
                                0,
                            itemBuilder: (context, index) => Option(
                              productID: id,
                              optionID: index,
                            ),
                          )),
                      // const Option(),
                      if (newOptionButton.newOption.value &&
                          !newOption.done.value)
                        newOption
                      else
                        newOptionButton,
                    ],
                  ),
                ),
              ),
              Variants(),
            ]),
          );
        }));
  }
}
