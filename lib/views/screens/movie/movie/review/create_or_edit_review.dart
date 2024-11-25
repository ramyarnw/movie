import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../model/review.dart';
import '../../../../../provider/provider_utils.dart';
import '../../../../../view_model/app_view_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/app_scaffold.dart';
import '../../../../widgets/app_text_form_field.dart';
import '../../../../widgets/app_texts.dart';
import '../../../../widgets/dropdown_button_form_field.dart';

class CreateOrEditReview extends StatefulWidget {
  const CreateOrEditReview({super.key, required this.movieId, this.reviewId});

  final String movieId;
  final String? reviewId;

  @override
  State<CreateOrEditReview> createState() => _CreateOrEditReviewState();
}

class _CreateOrEditReviewState extends State<CreateOrEditReview> {
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
    final BuiltList<Review> currentMovieReviews =
        context.appViewModel.getState().movieReview?[widget.movieId] ??
            BuiltList<Review>();
    final Review? b = currentMovieReviews
        .where((Review c) => c.id == widget.reviewId)
        .firstOrNull;
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
    return AppScaffold(
      appBar: ApplicationAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            AppDropdownButtonFormField<int>(
                value: review.star,
                items: <DropdownMenuItem<int>>[
                  for (int i = 1; i <= 5; i++) ...<DropdownMenuItem<int>>[
                    DropdownMenuItem<int>(
                      value: i,
                      child: AppText(
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
            AppTextFormField(
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
                  await context.appViewModel.updateMovieReview(
                      movieId: widget.movieId, review: review);
                } else {
                  await context.read<AppViewModel>().createMovieReview(
                        movieId: widget.movieId,
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
              child: AppText(widget.reviewId != null ? 'Update' : 'Create'),
            )
          ],
        ),
      ),
    );
  }
}
