import '../../../../ui.dart';
import '../../../navigation/app_routes.dart';

class TvDetailScreen extends StatefulWidget {
  const TvDetailScreen({
    super.key,
  });

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

late final int tvId;

class _TvDetailScreenState extends State<TvDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: <Widget>[
          const AppText('Tv Show details here'),
          ElevatedButton(
            onPressed: () {
              context.go(TvReviewScreenRoute(id: tvId).location);
              // Navigator.of(context).push(
              //   MaterialPageRoute<dynamic>(
              //     builder: (BuildContext c) => TvReviewScreen(
              //       tvId: tvId,
              //     ),
              //   ),
              // );
            },
            child: const AppText('Review'),
          ),
        ],
      ),
    );
  }
}
