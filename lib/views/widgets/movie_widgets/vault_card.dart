import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';
import '../../../data/storage_service_impl.dart';
import '../../../model/storage_model/storage_item.dart';
import 'edit_data_dialog.dart' show EditDataDialog;

class VaultCard extends StatefulWidget {
  const VaultCard({
    super.key,
    required this.item,
  });

  final StorageItem item;
  @override
  State<VaultCard> createState() => _VaultCardState();
}

class _VaultCardState extends State<VaultCard> {
  bool _visibility = false;
  final StorageService _storageService = StorageServiceImpl();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: const Offset(3, 3),
                    color: Colors.grey.shade300,
                    blurRadius: 5)
              ]),
          child: ListTile(
            onLongPress: () {
              setState(() {
                _visibility = !_visibility;
              });
            },
            title: Text(
              widget.item.key,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Visibility(
              visible: _visibility,
              child: Text(
                widget.item.value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            leading: const Icon(Icons.security, size: 30),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final String? updatedValue = await showDialog<String>(
                    context: context,
                    builder: (_) => EditDataDialog(item: widget.item));
                if (updatedValue?.isNotEmpty ?? false) {
                  _storageService
                      .writeSecureData(
                          newItem: StorageItem((StorageItemBuilder b) => b
                            ..key = widget.item.key
                            ..value = updatedValue))
                      .then((value) {
                    setState(() {});
                  });
                }
              },
            ),
          )),
    );
  }
}
