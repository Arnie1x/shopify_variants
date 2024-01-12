import 'package:flutter/material.dart';

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
