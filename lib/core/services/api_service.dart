import 'package:built_collection/built_collection.dart';
import 'package:movie/model/cast.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/model/tv_shows.dart';

abstract class ApiService {
  Future<BuiltList<Movie>> getPopularMovie();
  Future<Movie> getMovieForId({required int id});

  Future<Cast> getCastForId({required int id});

  Future<BuiltList<Movie>> getTopRatedMovie();

  Future<BuiltList<Movie>> getUpcomingMovie();

  Future<BuiltList<Cast>> getCastForMovie({required int id});

  Future<BuiltList<Movie>> getMoviesOfCast({required int id});

  Future<BuiltList<TvShows>> getTvShowsOfCast({required int id});
}
