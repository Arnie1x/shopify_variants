// This page is for displaying and creating the Product options and variants

import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

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
                child: Column(
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
                    const InputField(),
                    Text(
                      'Option Values',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const InputField(),
                    const NewOptionButton()
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}

class InputField extends StatelessWidget {
  final String? labelText;
  const InputField({
    super.key,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelText ?? "",
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () {},
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
