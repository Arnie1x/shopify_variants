import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/product_controller.dart';
import 'package:shopify_variants/models/product.dart';

class OptionsController extends GetxController {
  final Product product;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController optionNameController = TextEditingController();
  late RxList<TextEditingController>? valueControllers =
      <TextEditingController>[].obs;

  OptionsController({required this.product});

  void load() {}

  void save() {
    var productController = Get.find<ProductController>();
    Set<String> optionValues =
        valueControllers!.map((value) => value.text).toSet();

    Map<String, List<String>> options = {
      optionNameController.text: optionValues.toList()
    };

    if (productController.products[0].options == null) {
      productController.products[0].options = <Map<String, List<String>>>[
        options
      ];
    } else {
      productController.products[0].options!.add(options);
    }
    print(productController.products[0].options);
    optionNameController = TextEditingController();
    valueControllers = <TextEditingController>[].obs;
  }
}
