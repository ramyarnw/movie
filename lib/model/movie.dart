import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {

  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;
  Movie._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Movie.serializer, this)!
        as Map<String, dynamic>;
  }

  static Movie fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Movie.serializer, json)!;
  }

  static void _initializeBuilder(MovieBuilder b) {
    b
      ..adult = false
      ..backdropPath = '/417tYZ4XUyJrtyZXj7HpvWf1E8f.jpg'
      ..id = 1184918
      ..originalLanguage = 'en'
      ..originalTitle = 'The Wild Robot'
      ..popularity = 4950.682
      ..title = 'The Wild Robot'
      ..releaseDate = '2024-09-12'
      ..posterPath = '/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg'
      ..video = false
      ..voteAverage = 8.9
      ..voteCount = 1412
      ..overview =
          'After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. '
      ..genreIds = <int>[16, 878, 10751].toBuiltList().toBuilder();
  }

  static Serializer<Movie> get serializer => _$movieSerializer;

  bool get adult;

  @BuiltValueField(
    wireName: 'backdrop_path',
  )
  String get backdropPath;

  int get id;

  @BuiltValueField(
    wireName: 'genre_ids',
  )
  BuiltList<int> get genreIds;

  @BuiltValueField(
    wireName: 'original_language',
  )
  String get originalLanguage;

  @BuiltValueField(
    wireName: 'original_title',
  )
  String get originalTitle;

  String get overview;

  double get popularity;

  @BuiltValueField(
    wireName: 'poster_path',
  )
  String get posterPath;

  String get posterImage => 'https://image.tmdb.org/t/p/w500$posterPath';

  @BuiltValueField(
    wireName: 'release_date',
  )
  String get releaseDate;

  String get title;

  bool get video;

  @BuiltValueField(
    wireName: 'vote_average',
  )
  double get voteAverage;

  @BuiltValueField(
    wireName: 'vote_count',
  )
  int get voteCount;
}
