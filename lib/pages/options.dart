// This page is for displaying and creating the Product options and variants

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Options extends StatelessWidget {
  var controller = TextEditingController().obs;
  var count = 1.obs;
  var inputFields = RxList<InputField>();
  var controllers = RxList<TextEditingController>();
  Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product 1'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Options',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Option Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      InputField(),
                      Text(
                        'Option Values',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: inputFields.length,
                        itemBuilder: (context, index) {
                          var inputField = inputFields[index];
                          inputField.labelText = 'Option ${index + 1}';
                          inputField.onDelete = () {
                            inputFields.removeAt(index);
                            var controller = controllers[index];
                            controllers.removeAt(index);
                            controller.dispose();
                          };
                          return inputField;
                        },
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          var controller = TextEditingController();
                          inputFields.add(InputField(
                            controller: controller,
                          ));
                          controllers.add(controller);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add Option Value'),
                      ),
                      const NewOptionButton(),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}

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
  const NewOptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
