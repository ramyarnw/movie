import 'dart:async';

import 'package:go_router/go_router.dart';

import '../../ui.dart' hide RouterUtils;
import '../profile_page.dart';
import '../screens/movie/cast/cast_detail_screen.dart';
import '../screens/movie/login/edit_profile.dart';
import '../screens/movie/login/login_screen.dart';
import '../screens/movie/login/login_verify_screen.dart';
import '../screens/movie/movie/movie_detail_screen.dart';
import '../screens/movie/movie/movie_home_page.dart';
import '../screens/movie/movie/review/create_or_edit_review.dart';
import '../screens/movie/movie/review/movie_review_screen.dart';
import '../screens/movie/tv_shows/tv_detail_screen.dart';
import '../screens/movie/tv_shows/tv_review/create_or_edit_tv_review.dart';
import '../screens/movie/tv_shows/tv_review_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../terms_page.dart';

part 'app_routes.g.dart';

RouterConfig<Object> appRouter() {
  return GoRouter(
    routes: $appRoutes,
    redirect: (BuildContext c, GoRouterState s) {
      return null;
    },
    debugLogDiagnostics: true,
  );
}

extension RouteUtil on String {
  String withFrom(String? redirect) {
    final String r = redirect != null ? '?from=$redirect' : '';
    return '$this$r';
  }
}

abstract class AppRouterData extends GoRouteData {
  const AppRouterData();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (this is UnauthenticatedRouteData) {
      return null;
    }

    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return buildWidget(context, state);
  }

  Widget buildWidget(BuildContext context, GoRouterState state) {
    throw UnimplementedError('Implement buildWidget');
  }
}

mixin DesktopContainerMixin on AppRouterData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return buildWidget(context, state);
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // if(context.isDesktop) return DesktopContainer();
    return super.buildPage(context, state);
  }
}

abstract class AuthenticatedRouteData extends AppRouterData {
  const AuthenticatedRouteData();
}

abstract class UnauthenticatedRouteData extends AppRouterData {
  const UnauthenticatedRouteData();
}

/// Home Page
@TypedGoRoute<MovieHomePageRoute>(path: '/homePage')

@immutable
class MovieHomePageRoute extends AuthenticatedRouteData {
  @override
  Widget buildWidget(BuildContext context, GoRouterState state) {
    return const MovieHomePage();
  }
}

@immutable
class ProfilePageRoute extends AuthenticatedRouteData {
  const ProfilePageRoute({
    required this.id,
  });

  final int id;

  @override
  Widget buildWidget(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

@immutable
class TermsPageRoute extends UnauthenticatedRouteData {
  @override
  Widget buildWidget(BuildContext context, GoRouterState state) {
    return const TermsPage();
  }
}
//movieDetailScreen
@TypedGoRoute<MovieDetailScreenRoute>(path: '/movieDetail/:mid', name: 'md')

class MovieDetailScreenRoute extends UnauthenticatedRouteData {
  MovieDetailScreenRoute({required this.mid});

  final int mid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MovieDetailScreen(
      id: mid,
    );
  }
}
//splashScreen
@TypedGoRoute<SplashScreenRoute>(
  path: '/',
)
class SplashScreenRoute extends UnauthenticatedRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}
//castDetailScreen
@TypedGoRoute<CastDetailScreenRoute>(path: '/castDetail/:id')

class CastDetailScreenRoute extends UnauthenticatedRouteData {
  CastDetailScreenRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CastDetailScreen(id: id);
  }
}
//tvDetailScreen
@TypedGoRoute<TvDetailScreenRoute>(path: '/tvDetail')

class TvDetailScreenRoute extends UnauthenticatedRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TvDetailScreen();
  }
}
//editProfile
@TypedGoRoute<EditProfileRoute>(path: '/editProfile')

class EditProfileRoute extends UnauthenticatedRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditProfile();
  }
}
//loginScreen
@TypedGoRoute<LoginScreenRoute>(
  path: '/loginScreen',
)
class LoginScreenRoute extends UnauthenticatedRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}
//movieReviewPage
@TypedGoRoute<MovieReviewPageRoute>(
    path: '/movieReview/:rid', name: 'movieReview')
class MovieReviewPageRoute extends UnauthenticatedRouteData {
  MovieReviewPageRoute({required this.rid});

  final int rid;

  @override
  Widget buildWidget(BuildContext context, GoRouterState state) {
    return MovieReviewScreen(movieId: rid);
  }
}
//tvReviewScreen
@TypedGoRoute<TvReviewScreenRoute>(
  path: '/tvReview/:id',
)
class TvReviewScreenRoute extends UnauthenticatedRouteData {
  TvReviewScreenRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TvReviewScreen(tvId: id);
  }
}
//createOrEditReview
@TypedGoRoute<CreateOrEditReviewRoute>(path: '/createMovieReview/:cid')

class CreateOrEditReviewRoute extends UnauthenticatedRouteData {
  CreateOrEditReviewRoute({required this.cid});

  final int cid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreateOrEditReview(movieId: cid.toString());
  }
}
//createOrEditTvReview
@TypedGoRoute<CreateOrEditTvReviewRoute>(path: '/createTvReview/:id')

class CreateOrEditTvReviewRoute extends UnauthenticatedRouteData {
  CreateOrEditTvReviewRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreateOrEditTvReview(tvId: id.toString());
  }
}

//loginVerifyScreen
@TypedGoRoute<LoginVerifyScreenRoute>(path: '/loginVerify/:vid')

class LoginVerifyScreenRoute extends UnauthenticatedRouteData {
  LoginVerifyScreenRoute(this.vid);

  final String vid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginVerifyScreen(vid: vid);
  }
}
