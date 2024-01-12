import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/variants_controller.dart';

class Variants extends GetView<VariantsController> {
  RxList<String> variantsList = <String>[].obs;
  var id = int.parse(Get.parameters['id']!);
  Variants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.delete();
    Get.put(VariantsController(this));
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Variants',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.variantsList
                      .map((variant) => Text(
                            variant,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontSize: 20),
                          ))
                      .toList(),
                )
              ],
            )),
      ),
    );
  }
}
