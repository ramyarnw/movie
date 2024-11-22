import '../ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppProviderMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(context.strings.apr),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText(
              'You have pushed the button this many times:',
            ),
            // DisplayLarge(
            //   '${appState.count}',
            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            key: keys.homePageKeys.increment,
            onPressed: () {
              // context.appViewModel.increment();
            },
            tooltip: 'Increment',
            child: const AppIcon(Icons.add),
          ),
        ],
      ),
    );
  }
}
