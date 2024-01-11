// This page is for displaying and creating the Product options and variants

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_variants/controllers/options_controller.dart';
import 'package:shopify_variants/controllers/product_controller.dart';
import 'package:shopify_variants/models/product.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductController());
    var productController = Get.find<ProductController>();
    var id = Get.parameters['id'];
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
                            itemCount:
                                productController.products[0].options?.length ??
                                    0,
                            itemBuilder: (context, index) => Option(
                              id: index,
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
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Variants',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ]),
          );
        }));
  }
}

class Option extends StatelessWidget {
  final int id;
  const Option({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productController.products[0].options![id].keys.elementAt(0),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  size: 16,
                ),
                label: const Text('Edit'))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: productController.products[0].options![id].values
              .elementAt(0)
              .map((value) => Chip(label: Text(value)))
              .toList(),
        ),
        const Divider(),
      ],
    );
  }
}

// ignore: must_be_immutable
class OptionForm extends GetView<OptionsController> {
  final RxList<InputField>? valueInputFields;
  final Product product;
  // final RxList<TextEditingController>? valueControllers;
  var done = false.obs;
  OptionForm({super.key, required this.product, this.valueInputFields});

  @override
  Widget build(BuildContext context) {
    Get.delete();
    Get.put(OptionsController(product: product));
    var _valueInputFields = valueInputFields ?? RxList<InputField>();
    var _valueControllers = controller.valueControllers;
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
                itemCount: _valueInputFields.length,
                itemBuilder: (context, index) {
                  var inputField = _valueInputFields[index];
                  inputField.labelText = 'Option ${index + 1}';
                  inputField.onDelete = () {
                    _valueInputFields.removeAt(index);
                    var controller = _valueControllers![index];
                    _valueControllers.removeAt(index);
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
                      _valueInputFields.add(InputField(
                        controller: controller,
                      ));
                      _valueControllers!.add(controller);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Option Value'),
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: FilledButton.icon(
                      onPressed: () {
                        controller.save();
                        controller.valueControllers = _valueControllers;
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

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  final TextEditingController? controller;
  String? labelText;
  Function()? onDelete;
  InputField({
    super.key,
    this.labelText,
    this.controller,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText ?? "",
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete_forever,
                ))),
      ),
    );
  }
}

class NewOptionButton extends StatelessWidget {
  var newOption = false.obs;
  NewOptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        newOption.value = true;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 50,
            ),
            const Text('Add New Option'),
          ],
        ),
      ),
    );
  }
}
