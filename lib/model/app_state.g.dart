// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.popularMovie;
    if (value != null) {
      result
        ..add('popularMovie')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Movie)])));
    }
    value = object.topRatedMovie;
    if (value != null) {
      result
        ..add('topRatedMovie')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Movie)])));
    }
    value = object.upcomingMovie;
    if (value != null) {
      result
        ..add('upcomingMovie')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Movie)])));
    }
    value = object.castForMovie;
    if (value != null) {
      result
        ..add('castForMovie')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Cast)])));
    }
    value = object.moviesOfCast;
    if (value != null) {
      result
        ..add('moviesOfCast')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Movie)])));
    }
    value = object.tvShowsOfCast;
    if (value != null) {
      result
        ..add('tvShowsOfCast')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(TvShows)])));
    }
    value = object.currentPic;
    if (value != null) {
      result
        ..add('currentPic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Movie)));
    }
    value = object.currentPicCast;
    if (value != null) {
      result
        ..add('currentPicCast')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Cast)));
    }
    value = object.currentUser;
    if (value != null) {
      result
        ..add('currentUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AuthUser)));
    }
    value = object.movieReview;
    if (value != null) {
      result
        ..add('movieReview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(BuiltList, const [const FullType(Review)])
            ])));
    }
    value = object.tvReview;
    if (value != null) {
      result
        ..add('tvReview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(BuiltList, const [const FullType(Review)])
            ])));
    }
    value = object.item;
    if (value != null) {
      result
        ..add('item')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(StorageItem)));
    }
    value = object.itemList;
    if (value != null) {
      result
        ..add('itemList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(StorageItem)])));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'popularMovie':
          result.popularMovie.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'topRatedMovie':
          result.topRatedMovie.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'upcomingMovie':
          result.upcomingMovie.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'castForMovie':
          result.castForMovie.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Cast)]))!
              as BuiltList<Object?>);
          break;
        case 'moviesOfCast':
          result.moviesOfCast.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'tvShowsOfCast':
          result.tvShowsOfCast.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TvShows)]))!
              as BuiltList<Object?>);
          break;
        case 'currentPic':
          result.currentPic.replace(serializers.deserialize(value,
              specifiedType: const FullType(Movie))! as Movie);
          break;
        case 'currentPicCast':
          result.currentPicCast.replace(serializers.deserialize(value,
              specifiedType: const FullType(Cast))! as Cast);
          break;
        case 'currentUser':
          result.currentUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthUser))! as AuthUser);
          break;
        case 'movieReview':
          result.movieReview.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(Review)])
              ]))!);
          break;
        case 'tvReview':
          result.tvReview.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(Review)])
              ]))!);
          break;
        case 'item':
          result.item.replace(serializers.deserialize(value,
              specifiedType: const FullType(StorageItem))! as StorageItem);
          break;
        case 'itemList':
          result.itemList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(StorageItem)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Movie>? popularMovie;
  @override
  final BuiltList<Movie>? topRatedMovie;
  @override
  final BuiltList<Movie>? upcomingMovie;
  @override
  final BuiltList<Cast>? castForMovie;
  @override
  final BuiltList<Movie>? moviesOfCast;
  @override
  final BuiltList<TvShows>? tvShowsOfCast;
  @override
  final Movie? currentPic;
  @override
  final Cast? currentPicCast;
  @override
  final AuthUser? currentUser;
  @override
  final BuiltMap<String, BuiltList<Review>>? movieReview;
  @override
  final BuiltMap<String, BuiltList<Review>>? tvReview;
  @override
  final StorageItem? item;
  @override
  final BuiltList<StorageItem>? itemList;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._(
      {this.popularMovie,
      this.topRatedMovie,
      this.upcomingMovie,
      this.castForMovie,
      this.moviesOfCast,
      this.tvShowsOfCast,
      this.currentPic,
      this.currentPicCast,
      this.currentUser,
      this.movieReview,
      this.tvReview,
      this.item,
      this.itemList})
      : super._();

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        popularMovie == other.popularMovie &&
        topRatedMovie == other.topRatedMovie &&
        upcomingMovie == other.upcomingMovie &&
        castForMovie == other.castForMovie &&
        moviesOfCast == other.moviesOfCast &&
        tvShowsOfCast == other.tvShowsOfCast &&
        currentPic == other.currentPic &&
        currentPicCast == other.currentPicCast &&
        currentUser == other.currentUser &&
        movieReview == other.movieReview &&
        tvReview == other.tvReview &&
        item == other.item &&
        itemList == other.itemList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, popularMovie.hashCode);
    _$hash = $jc(_$hash, topRatedMovie.hashCode);
    _$hash = $jc(_$hash, upcomingMovie.hashCode);
    _$hash = $jc(_$hash, castForMovie.hashCode);
    _$hash = $jc(_$hash, moviesOfCast.hashCode);
    _$hash = $jc(_$hash, tvShowsOfCast.hashCode);
    _$hash = $jc(_$hash, currentPic.hashCode);
    _$hash = $jc(_$hash, currentPicCast.hashCode);
    _$hash = $jc(_$hash, currentUser.hashCode);
    _$hash = $jc(_$hash, movieReview.hashCode);
    _$hash = $jc(_$hash, tvReview.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, itemList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('popularMovie', popularMovie)
          ..add('topRatedMovie', topRatedMovie)
          ..add('upcomingMovie', upcomingMovie)
          ..add('castForMovie', castForMovie)
          ..add('moviesOfCast', moviesOfCast)
          ..add('tvShowsOfCast', tvShowsOfCast)
          ..add('currentPic', currentPic)
          ..add('currentPicCast', currentPicCast)
          ..add('currentUser', currentUser)
          ..add('movieReview', movieReview)
          ..add('tvReview', tvReview)
          ..add('item', item)
          ..add('itemList', itemList))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  ListBuilder<Movie>? _popularMovie;
  ListBuilder<Movie> get popularMovie =>
      _$this._popularMovie ??= new ListBuilder<Movie>();
  set popularMovie(ListBuilder<Movie>? popularMovie) =>
      _$this._popularMovie = popularMovie;

  ListBuilder<Movie>? _topRatedMovie;
  ListBuilder<Movie> get topRatedMovie =>
      _$this._topRatedMovie ??= new ListBuilder<Movie>();
  set topRatedMovie(ListBuilder<Movie>? topRatedMovie) =>
      _$this._topRatedMovie = topRatedMovie;

  ListBuilder<Movie>? _upcomingMovie;
  ListBuilder<Movie> get upcomingMovie =>
      _$this._upcomingMovie ??= new ListBuilder<Movie>();
  set upcomingMovie(ListBuilder<Movie>? upcomingMovie) =>
      _$this._upcomingMovie = upcomingMovie;

  ListBuilder<Cast>? _castForMovie;
  ListBuilder<Cast> get castForMovie =>
      _$this._castForMovie ??= new ListBuilder<Cast>();
  set castForMovie(ListBuilder<Cast>? castForMovie) =>
      _$this._castForMovie = castForMovie;

  ListBuilder<Movie>? _moviesOfCast;
  ListBuilder<Movie> get moviesOfCast =>
      _$this._moviesOfCast ??= new ListBuilder<Movie>();
  set moviesOfCast(ListBuilder<Movie>? moviesOfCast) =>
      _$this._moviesOfCast = moviesOfCast;

  ListBuilder<TvShows>? _tvShowsOfCast;
  ListBuilder<TvShows> get tvShowsOfCast =>
      _$this._tvShowsOfCast ??= new ListBuilder<TvShows>();
  set tvShowsOfCast(ListBuilder<TvShows>? tvShowsOfCast) =>
      _$this._tvShowsOfCast = tvShowsOfCast;

  MovieBuilder? _currentPic;
  MovieBuilder get currentPic => _$this._currentPic ??= new MovieBuilder();
  set currentPic(MovieBuilder? currentPic) => _$this._currentPic = currentPic;

  CastBuilder? _currentPicCast;
  CastBuilder get currentPicCast =>
      _$this._currentPicCast ??= new CastBuilder();
  set currentPicCast(CastBuilder? currentPicCast) =>
      _$this._currentPicCast = currentPicCast;

  AuthUserBuilder? _currentUser;
  AuthUserBuilder get currentUser =>
      _$this._currentUser ??= new AuthUserBuilder();
  set currentUser(AuthUserBuilder? currentUser) =>
      _$this._currentUser = currentUser;

  MapBuilder<String, BuiltList<Review>>? _movieReview;
  MapBuilder<String, BuiltList<Review>> get movieReview =>
      _$this._movieReview ??= new MapBuilder<String, BuiltList<Review>>();
  set movieReview(MapBuilder<String, BuiltList<Review>>? movieReview) =>
      _$this._movieReview = movieReview;

  MapBuilder<String, BuiltList<Review>>? _tvReview;
  MapBuilder<String, BuiltList<Review>> get tvReview =>
      _$this._tvReview ??= new MapBuilder<String, BuiltList<Review>>();
  set tvReview(MapBuilder<String, BuiltList<Review>>? tvReview) =>
      _$this._tvReview = tvReview;

  StorageItemBuilder? _item;
  StorageItemBuilder get item => _$this._item ??= new StorageItemBuilder();
  set item(StorageItemBuilder? item) => _$this._item = item;

  ListBuilder<StorageItem>? _itemList;
  ListBuilder<StorageItem> get itemList =>
      _$this._itemList ??= new ListBuilder<StorageItem>();
  set itemList(ListBuilder<StorageItem>? itemList) =>
      _$this._itemList = itemList;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _popularMovie = $v.popularMovie?.toBuilder();
      _topRatedMovie = $v.topRatedMovie?.toBuilder();
      _upcomingMovie = $v.upcomingMovie?.toBuilder();
      _castForMovie = $v.castForMovie?.toBuilder();
      _moviesOfCast = $v.moviesOfCast?.toBuilder();
      _tvShowsOfCast = $v.tvShowsOfCast?.toBuilder();
      _currentPic = $v.currentPic?.toBuilder();
      _currentPicCast = $v.currentPicCast?.toBuilder();
      _currentUser = $v.currentUser?.toBuilder();
      _movieReview = $v.movieReview?.toBuilder();
      _tvReview = $v.tvReview?.toBuilder();
      _item = $v.item?.toBuilder();
      _itemList = $v.itemList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              popularMovie: _popularMovie?.build(),
              topRatedMovie: _topRatedMovie?.build(),
              upcomingMovie: _upcomingMovie?.build(),
              castForMovie: _castForMovie?.build(),
              moviesOfCast: _moviesOfCast?.build(),
              tvShowsOfCast: _tvShowsOfCast?.build(),
              currentPic: _currentPic?.build(),
              currentPicCast: _currentPicCast?.build(),
              currentUser: _currentUser?.build(),
              movieReview: _movieReview?.build(),
              tvReview: _tvReview?.build(),
              item: _item?.build(),
              itemList: _itemList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'popularMovie';
        _popularMovie?.build();
        _$failedField = 'topRatedMovie';
        _topRatedMovie?.build();
        _$failedField = 'upcomingMovie';
        _upcomingMovie?.build();
        _$failedField = 'castForMovie';
        _castForMovie?.build();
        _$failedField = 'moviesOfCast';
        _moviesOfCast?.build();
        _$failedField = 'tvShowsOfCast';
        _tvShowsOfCast?.build();
        _$failedField = 'currentPic';
        _currentPic?.build();
        _$failedField = 'currentPicCast';
        _currentPicCast?.build();
        _$failedField = 'currentUser';
        _currentUser?.build();
        _$failedField = 'movieReview';
        _movieReview?.build();
        _$failedField = 'tvReview';
        _tvReview?.build();
        _$failedField = 'item';
        _item?.build();
        _$failedField = 'itemList';
        _itemList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
