// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_shows.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TvShows> _$tvShowsSerializer = new _$TvShowsSerializer();

class _$TvShowsSerializer implements StructuredSerializer<TvShows> {
  @override
  final Iterable<Type> types = const [TvShows, _$TvShows];
  @override
  final String wireName = 'TvShows';

  @override
  Iterable<Object?> serialize(Serializers serializers, TvShows object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'adult',
      serializers.serialize(object.adult, specifiedType: const FullType(bool)),
      'backdrop_path',
      serializers.serialize(object.backdropPath,
          specifiedType: const FullType(String)),
      'genre_ids',
      serializers.serialize(object.genreIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'origin_country',
      serializers.serialize(object.originCountry,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'original_name',
      serializers.serialize(object.originalName,
          specifiedType: const FullType(String)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'poster_path',
      serializers.serialize(object.posterPath,
          specifiedType: const FullType(String)),
      'first_air_date',
      serializers.serialize(object.firstAirDate,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'character',
      serializers.serialize(object.character,
          specifiedType: const FullType(String)),
      'credit_id',
      serializers.serialize(object.creditId,
          specifiedType: const FullType(String)),
      'episode_count',
      serializers.serialize(object.episodeCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  TvShows deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TvShowsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'origin_country':
          result.originCountry.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'original_name':
          result.originalName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'first_air_date':
          result.firstAirDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'episode_count':
          result.episodeCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TvShows extends TvShows {
  @override
  final bool adult;
  @override
  final String backdropPath;
  @override
  final BuiltList<int> genreIds;
  @override
  final int id;
  @override
  final BuiltList<String> originCountry;
  @override
  final String originalLanguage;
  @override
  final String originalName;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  final String posterPath;
  @override
  final String firstAirDate;
  @override
  final String name;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final String character;
  @override
  final String creditId;
  @override
  final int episodeCount;

  factory _$TvShows([void Function(TvShowsBuilder)? updates]) =>
      (new TvShowsBuilder()..update(updates))._build();

  _$TvShows._(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.firstAirDate,
      required this.name,
      required this.voteAverage,
      required this.voteCount,
      required this.character,
      required this.creditId,
      required this.episodeCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(adult, r'TvShows', 'adult');
    BuiltValueNullFieldError.checkNotNull(
        backdropPath, r'TvShows', 'backdropPath');
    BuiltValueNullFieldError.checkNotNull(genreIds, r'TvShows', 'genreIds');
    BuiltValueNullFieldError.checkNotNull(id, r'TvShows', 'id');
    BuiltValueNullFieldError.checkNotNull(
        originCountry, r'TvShows', 'originCountry');
    BuiltValueNullFieldError.checkNotNull(
        originalLanguage, r'TvShows', 'originalLanguage');
    BuiltValueNullFieldError.checkNotNull(
        originalName, r'TvShows', 'originalName');
    BuiltValueNullFieldError.checkNotNull(overview, r'TvShows', 'overview');
    BuiltValueNullFieldError.checkNotNull(popularity, r'TvShows', 'popularity');
    BuiltValueNullFieldError.checkNotNull(posterPath, r'TvShows', 'posterPath');
    BuiltValueNullFieldError.checkNotNull(
        firstAirDate, r'TvShows', 'firstAirDate');
    BuiltValueNullFieldError.checkNotNull(name, r'TvShows', 'name');
    BuiltValueNullFieldError.checkNotNull(
        voteAverage, r'TvShows', 'voteAverage');
    BuiltValueNullFieldError.checkNotNull(voteCount, r'TvShows', 'voteCount');
    BuiltValueNullFieldError.checkNotNull(character, r'TvShows', 'character');
    BuiltValueNullFieldError.checkNotNull(creditId, r'TvShows', 'creditId');
    BuiltValueNullFieldError.checkNotNull(
        episodeCount, r'TvShows', 'episodeCount');
  }

  @override
  TvShows rebuild(void Function(TvShowsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TvShowsBuilder toBuilder() => new TvShowsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TvShows &&
        adult == other.adult &&
        backdropPath == other.backdropPath &&
        genreIds == other.genreIds &&
        id == other.id &&
        originCountry == other.originCountry &&
        originalLanguage == other.originalLanguage &&
        originalName == other.originalName &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        firstAirDate == other.firstAirDate &&
        name == other.name &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount &&
        character == other.character &&
        creditId == other.creditId &&
        episodeCount == other.episodeCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, adult.hashCode);
    _$hash = $jc(_$hash, backdropPath.hashCode);
    _$hash = $jc(_$hash, genreIds.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, originCountry.hashCode);
    _$hash = $jc(_$hash, originalLanguage.hashCode);
    _$hash = $jc(_$hash, originalName.hashCode);
    _$hash = $jc(_$hash, overview.hashCode);
    _$hash = $jc(_$hash, popularity.hashCode);
    _$hash = $jc(_$hash, posterPath.hashCode);
    _$hash = $jc(_$hash, firstAirDate.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, voteAverage.hashCode);
    _$hash = $jc(_$hash, voteCount.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jc(_$hash, creditId.hashCode);
    _$hash = $jc(_$hash, episodeCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TvShows')
          ..add('adult', adult)
          ..add('backdropPath', backdropPath)
          ..add('genreIds', genreIds)
          ..add('id', id)
          ..add('originCountry', originCountry)
          ..add('originalLanguage', originalLanguage)
          ..add('originalName', originalName)
          ..add('overview', overview)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('firstAirDate', firstAirDate)
          ..add('name', name)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount)
          ..add('character', character)
          ..add('creditId', creditId)
          ..add('episodeCount', episodeCount))
        .toString();
  }
}

class TvShowsBuilder implements Builder<TvShows, TvShowsBuilder> {
  _$TvShows? _$v;

  bool? _adult;
  bool? get adult => _$this._adult;
  set adult(bool? adult) => _$this._adult = adult;

  String? _backdropPath;
  String? get backdropPath => _$this._backdropPath;
  set backdropPath(String? backdropPath) => _$this._backdropPath = backdropPath;

  ListBuilder<int>? _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int>? genreIds) => _$this._genreIds = genreIds;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<String>? _originCountry;
  ListBuilder<String> get originCountry =>
      _$this._originCountry ??= new ListBuilder<String>();
  set originCountry(ListBuilder<String>? originCountry) =>
      _$this._originCountry = originCountry;

  String? _originalLanguage;
  String? get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String? _originalName;
  String? get originalName => _$this._originalName;
  set originalName(String? originalName) => _$this._originalName = originalName;

  String? _overview;
  String? get overview => _$this._overview;
  set overview(String? overview) => _$this._overview = overview;

  double? _popularity;
  double? get popularity => _$this._popularity;
  set popularity(double? popularity) => _$this._popularity = popularity;

  String? _posterPath;
  String? get posterPath => _$this._posterPath;
  set posterPath(String? posterPath) => _$this._posterPath = posterPath;

  String? _firstAirDate;
  String? get firstAirDate => _$this._firstAirDate;
  set firstAirDate(String? firstAirDate) => _$this._firstAirDate = firstAirDate;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _voteAverage;
  double? get voteAverage => _$this._voteAverage;
  set voteAverage(double? voteAverage) => _$this._voteAverage = voteAverage;

  int? _voteCount;
  int? get voteCount => _$this._voteCount;
  set voteCount(int? voteCount) => _$this._voteCount = voteCount;

  String? _character;
  String? get character => _$this._character;
  set character(String? character) => _$this._character = character;

  String? _creditId;
  String? get creditId => _$this._creditId;
  set creditId(String? creditId) => _$this._creditId = creditId;

  int? _episodeCount;
  int? get episodeCount => _$this._episodeCount;
  set episodeCount(int? episodeCount) => _$this._episodeCount = episodeCount;

  TvShowsBuilder();

  TvShowsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _adult = $v.adult;
      _backdropPath = $v.backdropPath;
      _genreIds = $v.genreIds.toBuilder();
      _id = $v.id;
      _originCountry = $v.originCountry.toBuilder();
      _originalLanguage = $v.originalLanguage;
      _originalName = $v.originalName;
      _overview = $v.overview;
      _popularity = $v.popularity;
      _posterPath = $v.posterPath;
      _firstAirDate = $v.firstAirDate;
      _name = $v.name;
      _voteAverage = $v.voteAverage;
      _voteCount = $v.voteCount;
      _character = $v.character;
      _creditId = $v.creditId;
      _episodeCount = $v.episodeCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TvShows other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TvShows;
  }

  @override
  void update(void Function(TvShowsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TvShows build() => _build();

  _$TvShows _build() {
    _$TvShows _$result;
    try {
      _$result = _$v ??
          new _$TvShows._(
              adult: BuiltValueNullFieldError.checkNotNull(
                  adult, r'TvShows', 'adult'),
              backdropPath: BuiltValueNullFieldError.checkNotNull(
                  backdropPath, r'TvShows', 'backdropPath'),
              genreIds: genreIds.build(),
              id: BuiltValueNullFieldError.checkNotNull(id, r'TvShows', 'id'),
              originCountry: originCountry.build(),
              originalLanguage: BuiltValueNullFieldError.checkNotNull(
                  originalLanguage, r'TvShows', 'originalLanguage'),
              originalName: BuiltValueNullFieldError.checkNotNull(
                  originalName, r'TvShows', 'originalName'),
              overview: BuiltValueNullFieldError.checkNotNull(
                  overview, r'TvShows', 'overview'),
              popularity: BuiltValueNullFieldError.checkNotNull(
                  popularity, r'TvShows', 'popularity'),
              posterPath: BuiltValueNullFieldError.checkNotNull(
                  posterPath, r'TvShows', 'posterPath'),
              firstAirDate: BuiltValueNullFieldError.checkNotNull(
                  firstAirDate, r'TvShows', 'firstAirDate'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'TvShows', 'name'),
              voteAverage: BuiltValueNullFieldError.checkNotNull(voteAverage, r'TvShows', 'voteAverage'),
              voteCount: BuiltValueNullFieldError.checkNotNull(voteCount, r'TvShows', 'voteCount'),
              character: BuiltValueNullFieldError.checkNotNull(character, r'TvShows', 'character'),
              creditId: BuiltValueNullFieldError.checkNotNull(creditId, r'TvShows', 'creditId'),
              episodeCount: BuiltValueNullFieldError.checkNotNull(episodeCount, r'TvShows', 'episodeCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genreIds';
        genreIds.build();

        _$failedField = 'originCountry';
        originCountry.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TvShows', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
