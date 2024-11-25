// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $movieHomePageRoute,
      $movieDetailScreenRoute,
      $splashScreenRoute,
      $castDetailScreenRoute,
      $tvDetailScreenRoute,
      $editProfileRoute,
      $loginScreenRoute,
      $movieReviewPageRoute,
      $tvReviewScreenRoute,
      $createOrEditReviewRoute,
      $createOrEditTvReviewRoute,
      $loginVerifyScreenRoute,
    ];

RouteBase get $movieHomePageRoute => GoRouteData.$route(
      path: '/homePage',
      factory: $MovieHomePageRouteExtension._fromState,
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

RouteBase get $movieDetailScreenRoute => GoRouteData.$route(
      path: '/movieDetail/:mid',
      name: 'md',
      factory: $MovieDetailScreenRouteExtension._fromState,
    );

extension $MovieDetailScreenRouteExtension on MovieDetailScreenRoute {
  static MovieDetailScreenRoute _fromState(GoRouterState state) =>
      MovieDetailScreenRoute(
        mid: int.parse(state.pathParameters['mid']!),
      );

  String get location => GoRouteData.$location(
        '/movieDetail/${Uri.encodeComponent(mid.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $castDetailScreenRoute => GoRouteData.$route(
      path: '/castDetail/:id',
      factory: $CastDetailScreenRouteExtension._fromState,
    );

extension $CastDetailScreenRouteExtension on CastDetailScreenRoute {
  static CastDetailScreenRoute _fromState(GoRouterState state) =>
      CastDetailScreenRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/castDetail/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tvDetailScreenRoute => GoRouteData.$route(
      path: '/tvDetail',
      factory: $TvDetailScreenRouteExtension._fromState,
    );

extension $TvDetailScreenRouteExtension on TvDetailScreenRoute {
  static TvDetailScreenRoute _fromState(GoRouterState state) =>
      TvDetailScreenRoute();

  String get location => GoRouteData.$location(
        '/tvDetail',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editProfileRoute => GoRouteData.$route(
      path: '/editProfile',
      factory: $EditProfileRouteExtension._fromState,
    );

extension $EditProfileRouteExtension on EditProfileRoute {
  static EditProfileRoute _fromState(GoRouterState state) => EditProfileRoute();

  String get location => GoRouteData.$location(
        '/editProfile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginScreenRoute => GoRouteData.$route(
      path: '/loginScreen',
      factory: $LoginScreenRouteExtension._fromState,
    );

extension $LoginScreenRouteExtension on LoginScreenRoute {
  static LoginScreenRoute _fromState(GoRouterState state) => LoginScreenRoute();

  String get location => GoRouteData.$location(
        '/loginScreen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $movieReviewPageRoute => GoRouteData.$route(
      path: '/movieReview/:rid',
      name: 'movieReview',
      factory: $MovieReviewPageRouteExtension._fromState,
    );

extension $MovieReviewPageRouteExtension on MovieReviewPageRoute {
  static MovieReviewPageRoute _fromState(GoRouterState state) =>
      MovieReviewPageRoute(
        rid: int.parse(state.pathParameters['rid']!),
      );

  String get location => GoRouteData.$location(
        '/movieReview/${Uri.encodeComponent(rid.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tvReviewScreenRoute => GoRouteData.$route(
      path: '/tvReview/:id',
      factory: $TvReviewScreenRouteExtension._fromState,
    );

extension $TvReviewScreenRouteExtension on TvReviewScreenRoute {
  static TvReviewScreenRoute _fromState(GoRouterState state) =>
      TvReviewScreenRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/tvReview/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createOrEditReviewRoute => GoRouteData.$route(
      path: '/createMovieReview/:cid',
      factory: $CreateOrEditReviewRouteExtension._fromState,
    );

extension $CreateOrEditReviewRouteExtension on CreateOrEditReviewRoute {
  static CreateOrEditReviewRoute _fromState(GoRouterState state) =>
      CreateOrEditReviewRoute(
        cid: int.parse(state.pathParameters['cid']!),
      );

  String get location => GoRouteData.$location(
        '/createMovieReview/${Uri.encodeComponent(cid.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createOrEditTvReviewRoute => GoRouteData.$route(
      path: '/createTvReview/:id',
      factory: $CreateOrEditTvReviewRouteExtension._fromState,
    );

extension $CreateOrEditTvReviewRouteExtension on CreateOrEditTvReviewRoute {
  static CreateOrEditTvReviewRoute _fromState(GoRouterState state) =>
      CreateOrEditTvReviewRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/createTvReview/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginVerifyScreenRoute => GoRouteData.$route(
      path: '/loginVerify/:vid',
      factory: $LoginVerifyScreenRouteExtension._fromState,
    );

extension $LoginVerifyScreenRouteExtension on LoginVerifyScreenRoute {
  static LoginVerifyScreenRoute _fromState(GoRouterState state) =>
      LoginVerifyScreenRoute(
        state.pathParameters['vid']!,
      );

  String get location => GoRouteData.$location(
        '/loginVerify/${Uri.encodeComponent(vid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
