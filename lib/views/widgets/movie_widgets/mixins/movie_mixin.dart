import 'package:flutter/material.dart';

import '../../../../provider/provider_utils.dart';

mixin MovieMixin<T extends StatefulWidget> on State<T> {
  void showSnack(String e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e)));
  }

  Future<void> getPopularMovie() async {
    try {
      await context.appViewModel.getPopularMovie();
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getTopRatedMovie() async {
    try {
      await context.appViewModel.getUpcoming();
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getUpcoming() async {
    try {
      await context.appViewModel.getUpcoming();
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getMovieForId({required int id}) async {
    try {
      await context.appViewModel.getMovieForId(id: id);
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getCastForMovie({required int id}) async {
    try {
      await context.appViewModel.getCastForMovie(id: id);
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getCastForId({required int id}) async {
    try {
      await context.appViewModel.getCastForId(id: id);
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getMoviesOfCast({required int id}) async {
    try {
      await context.appViewModel.getMoviesOfCast(id: id);
    } catch (e) {
      showSnack(e.toString());
    }
  }

  Future<void> getTvShowsOfCast({required int id}) async {
    try {
      await context.appViewModel.getTvShowsOfCast(id: id);
    } catch (e) {
      showSnack(e.toString());
    }
  }

  void listenMovieReview({required String movieId}) {
    try {
      context.appViewModel.listenMovieReview(movieId: movieId.toString());
    } catch (e) {
      showSnack(e.toString());
    }
  }

  void listenTvReview({required String tvId}) {
    try {
      context.appViewModel.listenTvReview(tvId: tvId.toString());
    } catch (e) {
      showSnack(e.toString());
    }
  }
}
