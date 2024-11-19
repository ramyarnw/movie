library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:movie/model/review.dart';
import 'package:movie/model/storage_model/storage_item.dart';
import 'package:movie/model/tv_shows.dart';

import 'api_error.dart';
import 'app_state.dart';
import 'auth_user.dart';
import 'cast.dart';
import 'movie.dart';

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
