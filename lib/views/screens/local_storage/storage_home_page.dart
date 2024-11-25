import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../../model/storage_model/storage_item.dart';
import '../../../provider/provider_utils.dart';
import '../../../view_model/app_view_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/app_progress_indicator.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/app_texts.dart';
import '../../widgets/movie_widgets/add_data_dialog.dart';
import '../../widgets/movie_widgets/search_key_value_dialog.dart';
import '../../widgets/movie_widgets/vault_card.dart';

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

  Future<void> initList() async {
    await context.appViewModel.readAllSecureData();
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final BuiltList<StorageItem> items =
        context.appState.itemList ?? BuiltList<StorageItem>();
    return AppScaffold(
      appBar: ApplicationAppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () => showDialog(
                context: context, builder: (_) => const SearchKeyValueDialog()),
          )
        ],
      ),
      body: Center(
        child: _loading
            ? const AppProgressIndicator()
            : items.isEmpty
                ? const AppText('Add data in secure storage to display here.')
                : ListView.builder(
                    itemCount: items.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (_, int index) {
                      return Dismissible(
                        key: Key(items[index].toString()),
                        child: VaultCard(item: items[index]),
                        onDismissed: (DismissDirection direction) async {
                          await context.appViewModel
                              .deleteSecureData(item: items[index]);

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
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final AppViewModel appViewModel = context.appViewModel;
                    final StorageItem? newItem = await showDialog<StorageItem>(
                        context: context, builder: (_) => AddDataDialog());

                    if (newItem != null) {
                      appViewModel
                          .writeSecureData(newItem: newItem)
                          .then((void value) {
                        setState(() {
                          _loading = true;
                        });
                        initList();
                      });
                    }
                  },
                  child: const AppText('Add Data'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    context.appViewModel
                        .deleteAllSecureData()
                        .then((void value) {
                      initList();
                    });
                  },
                  child: const AppText('Delete All Data'),
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
