import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie/model/serializers.dart';

part 'review.g.dart';

abstract class Review implements Built<Review, ReviewBuilder> {
  Review._();
  factory Review([void Function(ReviewBuilder) updates]) = _$Review;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Review.serializer, this)
        as Map<String, dynamic>;
  }

  static Review fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Review.serializer, json)!;
  }

  static Serializer<Review> get serializer => _$reviewSerializer;
  int get star;
  String? get comments;
  String get id;
  String get userId;
}
