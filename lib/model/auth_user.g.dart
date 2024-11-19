// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthUser> _$authUserSerializer = new _$AuthUserSerializer();

class _$AuthUserSerializer implements StructuredSerializer<AuthUser> {
  @override
  final Iterable<Type> types = const [AuthUser, _$AuthUser];
  @override
  final String wireName = 'AuthUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phoneNo',
      serializers.serialize(object.phoneNo,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profile;
    if (value != null) {
      result
        ..add('profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phoneNo':
          result.phoneNo = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'profile':
          result.profile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthUser extends AuthUser {
  @override
  final String? name;
  @override
  final String phoneNo;
  @override
  final String id;
  @override
  final String? profile;

  factory _$AuthUser([void Function(AuthUserBuilder)? updates]) =>
      (new AuthUserBuilder()..update(updates))._build();

  _$AuthUser._(
      {this.name, required this.phoneNo, required this.id, this.profile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(phoneNo, r'AuthUser', 'phoneNo');
    BuiltValueNullFieldError.checkNotNull(id, r'AuthUser', 'id');
  }

  @override
  AuthUser rebuild(void Function(AuthUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthUserBuilder toBuilder() => new AuthUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthUser &&
        name == other.name &&
        phoneNo == other.phoneNo &&
        id == other.id &&
        profile == other.profile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, phoneNo.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthUser')
          ..add('name', name)
          ..add('phoneNo', phoneNo)
          ..add('id', id)
          ..add('profile', profile))
        .toString();
  }
}

class AuthUserBuilder implements Builder<AuthUser, AuthUserBuilder> {
  _$AuthUser? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _phoneNo;
  String? get phoneNo => _$this._phoneNo;
  set phoneNo(String? phoneNo) => _$this._phoneNo = phoneNo;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _profile;
  String? get profile => _$this._profile;
  set profile(String? profile) => _$this._profile = profile;

  AuthUserBuilder();

  AuthUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _phoneNo = $v.phoneNo;
      _id = $v.id;
      _profile = $v.profile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthUser;
  }

  @override
  void update(void Function(AuthUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthUser build() => _build();

  _$AuthUser _build() {
    final _$result = _$v ??
        new _$AuthUser._(
            name: name,
            phoneNo: BuiltValueNullFieldError.checkNotNull(
                phoneNo, r'AuthUser', 'phoneNo'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'AuthUser', 'id'),
            profile: profile);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
