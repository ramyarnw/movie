library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'api_error.dart';
import 'app_state.dart';
import 'auth_user.dart';
import 'cast.dart';
import 'movie.dart';
import 'review.dart';
import 'storage_model/storage_item.dart';
import 'tv_shows.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  ApiError,
  AuthUser,
  StorageItem,
  Review,
  TvShows,
  Cast,
  Movie
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
