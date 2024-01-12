import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/options_controller.dart';
import 'package:shopify_variants/models/product.dart';
import 'package:shopify_variants/widgets/input_field.dart';

class OptionForm extends GetView<OptionsController> {
  // final RxList<InputField>? valueInputFields;
  final Product product;
  // final RxList<TextEditingController>? valueControllers;
  var done = false.obs;
  OptionForm({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Get.delete();
    Get.put(OptionsController(product: product));
    var valueInputFields = RxList<InputField>();
    var valueControllers = controller.valueControllers;
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Option Name',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InputField(
            controller: controller.optionNameController,
          ),
          Text(
            'Option Values',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: valueInputFields.length,
                itemBuilder: (context, index) {
                  var inputField = valueInputFields[index];
                  inputField.labelText = 'Option ${index + 1}';
                  inputField.onDelete = () {
                    valueInputFields.removeAt(index);
                    this.controller.delete();
                    var controller = valueControllers![index];
                    valueControllers.removeAt(index);
                    controller.dispose();
                  };
                  return inputField;
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 36,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      var controller = TextEditingController();
                      valueInputFields.add(InputField(
                        controller: controller,
                      ));
                      valueControllers!.add(controller);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Option Value'),
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: FilledButton.icon(
                      onPressed: () {
                        controller.valueControllers = valueControllers;
                        controller.save();
                        done.value = true;
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Done')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
