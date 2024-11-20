import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/review.dart';
import '../../../view_model/app_view_model.dart';

class CreateOrEditTvReview extends StatefulWidget {
  const CreateOrEditTvReview({super.key, required this.tvId, this.reviewId});
final String tvId;
final String? reviewId;
  @override
  State<CreateOrEditTvReview> createState() => _CreateOrEditTvReviewState();
}

class _CreateOrEditTvReviewState extends State<CreateOrEditTvReview> {
  Review review = Review(
        (ReviewBuilder b) => b
      ..star = 1
      ..comments = ''
      ..id = ''
      ..userId = '',
  );
  @override
  void initState() {
    super.initState();
    if (widget.reviewId == null) {
      return;
    }
    final BuiltList<Review> currentTvReviews =
        context.read<AppViewModel>().getState().tvReview?[widget.tvId] ??
            BuiltList();
    final Review? b =
        currentTvReviews.where((Review c) => c.id == widget.reviewId).firstOrNull;
    if (b == null) {
      return;
    }
    review = b;
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButtonFormField<int>(
                value: review.star,
                items: <DropdownMenuItem<int>>[
                  for (int i = 1; i <= 5; i++) ...<DropdownMenuItem<int>>[
                    DropdownMenuItem(
                      value: i,
                      child: Text(
                        i.toString(),
                      ),
                    ),
                  ],
                ],
                onChanged: (int? v) {
                  if (v == null) {
                    return;
                  }
                  review = review.rebuild((ReviewBuilder p0) => p0.star = v);
                  setState(() {});
                }),
            TextFormField(
              initialValue: review.comments,
              onChanged: (String s) {
                review = review.rebuild((ReviewBuilder p) => p.comments = s);
                setState(() {});
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Comments enter here',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (widget.reviewId != null) {
                  await context.read<AppViewModel>().updateTvReview(
                      tvId: widget.tvId, review: review);
                } else {
                  await context.read<AppViewModel>().createTVReview(
                    tvId: widget.tvId,
                    review: review.rebuild(
                          (ReviewBuilder p0) => p0.userId = context
                          .read<AppViewModel>()
                          .getState()
                          .currentUser!
                          .id,
                    ),
                  );
                }
              },
              child: Text(widget.reviewId != null ? 'Update' : 'Create'),
            )
          ],
        ),
      ),
    );
  }
}
