import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
