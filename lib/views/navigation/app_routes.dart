import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:movie/views/screens/app/tv_detail_screen.dart';

import '../../ui.dart' hide RouterUtils;
import '../profile_page.dart';
import '../screens/app/cast_detail_screen.dart';
import '../screens/app/movie_detail_screen.dart';
import '../screens/app/movie_home_page.dart';
import '../screens/load_splash/splash_screen.dart';
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
@TypedGoRoute<MovieHomePageRoute>(
    path: '/homePage',
    routes: <TypedRoute<RouteData>>[
      TypedGoRoute<MovieDetailScreenRoute>(path: 'movieDetail', routes: [
        TypedGoRoute<CastDetailScreenRoute>(path: 'castDetail', routes: [
          TypedGoRoute<MovieDetailScreenRoute>(path: 'movieDetail', routes: []),
          TypedGoRoute<TvDetailScreenRoute>(path: 'tvDetail'),
        ])
      ]),
    ])
@TypedGoRoute<SplashScreenRoute>(
  path: '/',
)
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

class MovieDetailScreenRoute extends UnauthenticatedRouteData {
  MovieDetailScreenRoute({required this.id});
  final int id;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MovieDetailScreen(
      id: id,
    );
  }
}

class SplashScreenRoute extends UnauthenticatedRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

class CastDetailScreenRoute extends UnauthenticatedRouteData {
  CastDetailScreenRoute({required this.id});
  final int id;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CastDetailScreen(id: id);
  }
}

class TvDetailScreenRoute extends UnauthenticatedRouteData {
  TvDetailScreenRoute({required this.id});
  final int id;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TvDetailScreen(id: id);
  }
}
