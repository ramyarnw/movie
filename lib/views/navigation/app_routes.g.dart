// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $movieHomePageRoute,
    ];

RouteBase get $movieHomePageRoute => GoRouteData.$route(
      path: '/homePage',
      factory: $MovieHomePageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'movieDetail',
          factory: $MovieDetailScreenRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'castDetail',
              factory: $CastDetailScreenRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'movieDetail',
                  factory: $MovieDetailScreenRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'tvDetail',
                  factory: $TvDetailScreenRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MovieHomePageRouteExtension on MovieHomePageRoute {
  static MovieHomePageRoute _fromState(GoRouterState state) =>
      MovieHomePageRoute();

  String get location => GoRouteData.$location(
        '/homePage',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MovieDetailScreenRouteExtension on MovieDetailScreenRoute {
  static MovieDetailScreenRoute _fromState(GoRouterState state) =>
      MovieDetailScreenRoute(
        id: int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/homePage/movieDetail',
        queryParams: {
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CastDetailScreenRouteExtension on CastDetailScreenRoute {
  static CastDetailScreenRoute _fromState(GoRouterState state) =>
      CastDetailScreenRoute(
        id: int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/homePage/movieDetail/castDetail',
        queryParams: {
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MovieDetailScreenRouteExtension on MovieDetailScreenRoute {
  static MovieDetailScreenRoute _fromState(GoRouterState state) =>
      MovieDetailScreenRoute(
        id: int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/homePage/movieDetail/castDetail/movieDetail',
        queryParams: {
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TvDetailScreenRouteExtension on TvDetailScreenRoute {
  static TvDetailScreenRoute _fromState(GoRouterState state) =>
      TvDetailScreenRoute(
        id: int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/homePage/movieDetail/castDetail/tvDetail',
        queryParams: {
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
