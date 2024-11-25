import 'package:built_collection/built_collection.dart';
import 'package:flutter/services.dart';
import '../../model/auth_user.dart';
import '../../model/review.dart';

abstract class FireBaseService {
  Future<String> sendOtp({
    required String phoneNo,
  });

  Future<void> verifyOtp({
    required String smsCode,
    required String vid,
  });

  Future<AuthUser> getUser({
    required String uid,
    required String phoneNo,
  });

  Future<Review> getMovieReview({
    required String movieId,
    required String reviewId,
  });

  Future<void> updateMovieReview({
    required String movieId,
    required Review review,
  });

  Future<void> createMovieReview({
    required String movieId,
    required Review review,
  });

  Future<void> deleteMovieReview({
    required String movieId,
    required String reviewId,
  });

  Stream<BuiltList<Review>> listenMovieReview({
    required String movieId,
  });

  Future<Review> getTvReview({
    required String tvId,
    required String reviewId,
  });

  Future<void> updateTvReview({
    required String tvId,
    required Review review,
  });

  Future<void> createTVReview({
    required String tvId,
    required Review review,
  });

  Future<void> deleteTVReview({
    required String tvId,
    required String reviewId,
  });

  Stream<BuiltList<Review>> listenTVReview({
    required String tvId,
  });

  Future<AuthUser> updateUser({
    required AuthUser user,
  });

  Future<AuthUser> updateProfile({
    required Uint8List file,
    required AuthUser user,
  });
}
