import 'package:built_collection/built_collection.dart';
import '../../../../model/review.dart';
import '../../../../ui.dart';
import '../../../mixins/movie_mixin.dart';
import '../../../navigation/app_routes.dart';

class TvReviewScreen extends StatefulWidget {
  const TvReviewScreen({super.key, required this.tvId});

  final int tvId;

  @override
  State<TvReviewScreen> createState() => _TvReviewScreenState();
}

class _TvReviewScreenState extends State<TvReviewScreen> with MovieMixin<TvReviewScreen>{
  @override
  void initState() {
    super.initState();
    listenTvReview(tvId: widget.tvId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final BuiltList<Review> review =
        context.appState.tvReview?[widget.tvId] ?? BuiltList<Review>();
    return AppScaffold(
      appBar: ApplicationAppBar(
        title: const AppText('Tv Review Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.go(CreateOrEditTvReviewRoute(id: widget.tvId).location);
        // Navigator.push(context,
        //     MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        //   return CreateOrEditTvReview(tvId: widget.tvId.toString());
        // }));
      },child: const AppIcon(Icons.add),),
      body: ListView.builder(
          itemCount: review.length,
          itemBuilder: (BuildContext context, int index) {
            final Review p = review[index];
            return ListTile(
              title: AppText(p.comments ?? ''),
              subtitle: AppText(p.star.toString()),
            );
          }),
    );
  }
}
