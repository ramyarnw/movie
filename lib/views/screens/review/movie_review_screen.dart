import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../../model/review.dart';
import '../../../provider/provider_utils.dart';
import '../../widgets/movie_widgets/mixins/movie_mixin.dart';
import 'create_or_edit_review.dart';


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

  // void listenMovieReview() {
  //   context
  //       .appViewModel
  //       .listenMovieReview(movieId: widget.movieId.toString());
  // }

  @override
  Widget build(BuildContext context) {
    final BuiltList<Review> review =
        context.appState.movieReview?[widget.movieId] ?? BuiltList<Review>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Review Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute<dynamic>(builder: (BuildContext context) {
              return CreateOrEditReview(movieId: widget.movieId.toString());
            },
            ),
        );
      }, child: const Icon(Icons.add),),


      body: ListView.builder(
          itemCount: review.length,
          itemBuilder: (BuildContext context, int index) {
            final Review p = review[index];
            return ListTile(
              title: Text(p.comments ?? ''),
              subtitle: Text(p.star.toString()),
            );
          }),
    );
  }
}
