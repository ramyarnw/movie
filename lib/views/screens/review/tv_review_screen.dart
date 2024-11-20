import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import '../../../model/review.dart';
import '../../../provider/provider_utils.dart';
import 'create_or_edit_tv_review.dart';

class TvReviewScreen extends StatefulWidget {
  const TvReviewScreen({super.key, required this.tvId});

  final int tvId;

  @override
  State<TvReviewScreen> createState() => _TvReviewScreenState();
}

class _TvReviewScreenState extends State<TvReviewScreen> with MovieMixin{
  @override
  void initState() {
    super.initState();
    listenTvReview(tvId: widget.tvId.toString());
  }

  // void listenTvReview() {
  //   context
  //       .appViewModel
  //       .listenTvReview(tvId: widget.tvId.toString());
  // }

  @override
  Widget build(BuildContext context) {
    final BuiltList<Review> review =
        context.appState.tvReview?[widget.tvId] ?? BuiltList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv Review Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return CreateOrEditTvReview(tvId: widget.tvId.toString());
        }));
      },child: const Icon(Icons.add),),
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
