import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie/model/serializers.dart';

part 'auth_user.g.dart';

abstract class AuthUser implements Built<AuthUser, AuthUserBuilder> {
  AuthUser._();

  factory AuthUser([void Function(AuthUserBuilder) updates]) = _$AuthUser;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthUser.serializer, this)
        as Map<String, dynamic>;
  }

  static AuthUser fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthUser.serializer, json)!;
  }

  static Serializer<AuthUser> get serializer => _$authUserSerializer;

  String? get name;

  String get phoneNo;

  String get id;

  String? get profile;
}
