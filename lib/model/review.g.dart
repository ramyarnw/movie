// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Review> _$reviewSerializer = new _$ReviewSerializer();

class _$ReviewSerializer implements StructuredSerializer<Review> {
  @override
  final Iterable<Type> types = const [Review, _$Review];
  @override
  final String wireName = 'Review';

  @override
  Iterable<Object?> serialize(Serializers serializers, Review object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'star',
      serializers.serialize(object.star, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Review deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'star':
          result.star = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Review extends Review {
  @override
  final int star;
  @override
  final String? comments;
  @override
  final String id;
  @override
  final String userId;

  factory _$Review([void Function(ReviewBuilder)? updates]) =>
      (new ReviewBuilder()..update(updates))._build();

  _$Review._(
      {required this.star,
      this.comments,
      required this.id,
      required this.userId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(star, r'Review', 'star');
    BuiltValueNullFieldError.checkNotNull(id, r'Review', 'id');
    BuiltValueNullFieldError.checkNotNull(userId, r'Review', 'userId');
  }

  @override
  Review rebuild(void Function(ReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBuilder toBuilder() => new ReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Review &&
        star == other.star &&
        comments == other.comments &&
        id == other.id &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, star.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Review')
          ..add('star', star)
          ..add('comments', comments)
          ..add('id', id)
          ..add('userId', userId))
        .toString();
  }
}

class ReviewBuilder implements Builder<Review, ReviewBuilder> {
  _$Review? _$v;

  int? _star;
  int? get star => _$this._star;
  set star(int? star) => _$this._star = star;

  String? _comments;
  String? get comments => _$this._comments;
  set comments(String? comments) => _$this._comments = comments;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ReviewBuilder();

  ReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _star = $v.star;
      _comments = $v.comments;
      _id = $v.id;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Review other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Review;
  }

  @override
  void update(void Function(ReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Review build() => _build();

  _$Review _build() {
    final _$result = _$v ??
        new _$Review._(
            star:
                BuiltValueNullFieldError.checkNotNull(star, r'Review', 'star'),
            comments: comments,
            id: BuiltValueNullFieldError.checkNotNull(id, r'Review', 'id'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'Review', 'userId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
