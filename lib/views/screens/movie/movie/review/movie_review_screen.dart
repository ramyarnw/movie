import 'package:built_collection/built_collection.dart';

import '../../../../../model/review.dart';
import '../../../../../ui.dart';
import '../../../../mixins/movie_mixin.dart';
import '../../../../navigation/app_routes.dart';


class MovieReviewScreen extends StatefulWidget {
  const MovieReviewScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieReviewScreen> createState() => _MovieReviewScreenState();
}

class _MovieReviewScreenState extends State<MovieReviewScreen> with MovieMixin<MovieReviewScreen> {
  @override
  void initState() {
    super.initState();
    listenMovieReview(movieId: widget.movieId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final BuiltList<Review> review =
        context.appState.movieReview?[widget.movieId] ?? BuiltList<Review>();

    return AppScaffold(
      appBar: ApplicationAppBar(
        title: const AppText('Movie Review Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.go(CreateOrEditReviewRoute(cid: widget.movieId).location);
        // Navigator.push(context,
        //     MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        //       return CreateOrEditReview(movieId: widget.movieId.toString());
        //     },
        //     ),
        // );
      }, child: const AppIcon(Icons.add),),


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
