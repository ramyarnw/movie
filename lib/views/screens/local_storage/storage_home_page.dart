import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../../model/storage_model/storage_item.dart';
import '../../../provider/provider_utils.dart';
class StorageHomePage extends StatefulWidget {
  const StorageHomePage({super.key, required this.title});

  final String title;

  @override
  State<StorageHomePage> createState() => _StorageHomePageState();
}

class _StorageHomePageState extends State<StorageHomePage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async {
    await context.appViewModel.readAllSecureData();
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final BuiltList<StorageItem> _items = context.appState.itemList ?? BuiltList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () => showDialog(
                context: context, builder: (_) => const SearchKeyValueDialog()),
          )
        ],
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _items.isEmpty
                ? const Text('Add data in secure storage to display here.')
                : ListView.builder(
                    itemCount: _items.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (_, int index) {
                      return Dismissible(
                        key: Key(_items[index].toString()),
                        child: VaultCard(item: _items[index]),
                        onDismissed: (direction) async {
                          await context.appViewModel
                              .deleteSecureData(item: _items[index]);

                          initList();
                        },
                      );
                    }),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final StorageItem? newItem = await showDialog<StorageItem>(
                        context: context, builder: (_) => AddDataDialog());
                    if (newItem != null) {
                      context.appViewModel
                          .writeSecureData(newItem: newItem)
                          .then((value) {
                        setState(() {
                          _loading = true;
                        });
                        initList();
                      });
                    }
                  },
                  child: const Text('Add Data'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    context.appViewModel
                        .deleteAllSecureData()
                        .then((value) => initList());
                  },
                  child: const Text('Delete All Data'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
