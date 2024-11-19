import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie/model/serializers.dart';

part 'tv_shows.g.dart';

abstract class TvShows implements Built<TvShows, TvShowsBuilder> {
  TvShows._();

  factory TvShows([void Function(TvShowsBuilder) updates]) = _$TvShows;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TvShows.serializer, this)
        as Map<String, dynamic>;
  }

  static TvShows fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TvShows.serializer, json)!;
  }

  static Serializer<TvShows> get serializer => _$tvShowsSerializer;

  bool get adult;

  @BuiltValueField(
    wireName: 'backdrop_path',
  )
  String get backdropPath;

  @BuiltValueField(
    wireName: 'genre_ids',
  )
  BuiltList<int> get genreIds;

  int get id;

  @BuiltValueField(
    wireName: 'origin_country',
  )
  BuiltList<String> get originCountry;

  @BuiltValueField(
    wireName: 'original_language',
  )
  String get originalLanguage;

  @BuiltValueField(
    wireName: 'original_name',
  )
  String get originalName;

  String get overview;

  double get popularity;

  @BuiltValueField(
    wireName: 'poster_path',
  )
  String get posterPath;
  String get posterImage => 'https://image.tmdb.org/t/p/w500$posterPath';
  @BuiltValueField(
    wireName: 'first_air_date',
  )
  String get firstAirDate;

  String get name;

  @BuiltValueField(
    wireName: 'vote_average',
  )
  double get voteAverage;

  @BuiltValueField(
    wireName: 'vote_count',
  )
  int get voteCount;

  String get character;

  @BuiltValueField(
    wireName: 'credit_id',
  )
  String get creditId;

  @BuiltValueField(
    wireName: 'episode_count',
  )
  int get episodeCount;
}
