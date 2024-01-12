import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/product_controller.dart';
import 'package:shopify_variants/controllers/variants_controller.dart';
import 'package:shopify_variants/models/product.dart';

class OptionsController extends GetxController {
  final Product product;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController optionNameController = TextEditingController();
  late RxList<TextEditingController>? valueControllers =
      <TextEditingController>[].obs;

  OptionsController({required this.product});

  var variantsController = Get.find<VariantsController>();

  void delete() {
    variantsController.variantsList.clear();
    variantsController.updateVariants();
    variantsController.update();
  }

  void save() {
    // var productController = Get.find<ProductController>();
    Set<String> optionValues =
        valueControllers!.map((value) => value.text).toSet();

    Map<String, List<String>> options = {
      optionNameController.text: optionValues.toList()
    };

    if (product.options == null) {
      product.options = <Map<String, List<String>>>[options].obs;
    } else {
      product.options!.add(options);
    }

    variantsController.variantsList = variantsController.updateVariants();

    optionNameController.dispose();
    valueControllers?.clear();

    optionNameController = TextEditingController();
    valueControllers = <TextEditingController>[].obs;
  }
}
