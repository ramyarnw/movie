import 'package:flutter/material.dart';
import 'package:movie/views/widgets/movie_widgets/text_field_decoration.dart';

import '../../../model/storage_model/storage_item.dart';

class AddDataDialog extends StatelessWidget {
  AddDataDialog({Key? key}) : super(key: key);
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _keyController,
              decoration: textFieldDecoration(hintText: "Enter Key"),
            ),
            TextFormField(
              controller: _valueController,
              decoration: textFieldDecoration(hintText: "Enter Value"),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      final StorageItem storageItem = StorageItem((b) => b
                        ..key = _keyController.text
                        ..value = _valueController.text);
                      Navigator.of(context).pop(storageItem);
                    },
                    child: const Text('Secure')))
          ],
        ),
      ),
    );
  }
}
