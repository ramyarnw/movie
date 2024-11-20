import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
value.dart';
import 'package:built_value/serializer.dart';

import 'auth_user.dart';
import 'cast.dart';
import 'movie.dart';
import 'review.dart';
import 'serializers.dart';
import 'storage_model/storage_item.dart';
import 'tv_shows.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
  AppState._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppState.serializer, this)!
        as Map<String, int>;
  }

  static AppState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppState.serializer, json)!;
  }

  static Serializer<AppState> get serializer => _$appStateSerializer;

  BuiltList<Movie>? get popularMovie;

  BuiltList<Movie>? get topRatedMovie;

  BuiltList<Movie>? get upcomingMovie;

  BuiltList<Cast>? get castForMovie;

  BuiltList<Movie>? get moviesOfCast;

  BuiltList<TvShows>? get tvShowsOfCast;

  Movie? get currentPic;

  Cast get currentPicCast;

  AuthUser? get currentUser;

  BuiltMap<String, BuiltList<Review>>? get movieReview;

  BuiltMap<String, BuiltList<Review>>? get tvReview;

  StorageItem? get item;

  BuiltList<StorageItem>? get itemList;
}
