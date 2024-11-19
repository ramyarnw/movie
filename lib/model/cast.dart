import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie/model/serializers.dart';

part 'cast.g.dart';

abstract class Cast implements Built<Cast, CastBuilder> {
  Cast._();

  factory Cast([void Function(CastBuilder) updates]) = _$Cast;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Cast.serializer, this)
        as Map<String, dynamic>;
  }

  static Cast fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Cast.serializer, json)!;
  }

  static Serializer<Cast> get serializer => _$castSerializer;

  static void _initializeBuilder(CastBuilder a) {
    a
      ..adult = false
      ..gender = 1
      ..id = 1267329
      ..knownForDepartment = 'Acting'
      ..name = 'Lupita Nyong'
      ..originalName = 'Lupita Nyong'
      ..popularity = 32.847
      ..profilePath = '/y40Wu1T742kynOqtwXASc5Qgm49.jpg'
      ..castId = 9
      ..character = 'Roz / Rummage (voice)'
      ..creditId = '65c03d8ffc65380163eaf41c'
      ..order = 0;
  }

  bool get adult;

  int get gender;

  int get id;

  @BuiltValueField(
    wireName: 'known_for_department',
  )
  String get knownForDepartment;

  String get name;

  @BuiltValueField(
    wireName: 'original_name',
  )
  String get originalName;

  double get popularity;

  @BuiltValueField(
    wireName: 'profile_path',
  )
  String get profilePath;
  String get posterImage => 'https://image.tmdb.org/t/p/w500$profilePath';

  @BuiltValueField(
    wireName: 'cast_id',
  )
  int get castId;

  String get character;

  @BuiltValueField(
    wireName: 'credit_id',
  )
  String get creditId;

  int get order;
}
