// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/empty/empty_screen.dart' as _i5;
import '../features/main_screen/view/main_screen.dart' as _i2;
import '../features/profile/view/profile_screen.dart' as _i4;
import '../features/recommendations/view/recommendations_screen_provider.dart'
    as _i3;
import '../features/splash/view/splash_screen.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainScreen(),
      );
    },
    RecommendationsScreenProviderRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RecommendationsScreenProvider(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    EmptyScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          SplashScreenRoute.name,
          path: 'splash',
        ),
        _i6.RouteConfig(
          MainScreenRoute.name,
          path: 'main',
          children: [
            _i6.RouteConfig(
              RecommendationsScreenProviderRoute.name,
              path: 'recs',
              parent: MainScreenRoute.name,
            ),
            _i6.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: MainScreenRoute.name,
            ),
            _i6.RouteConfig(
              EmptyScreenRoute.name,
              path: 'empty',
              parent: MainScreenRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.MainScreen]
class MainScreenRoute extends _i6.PageRouteInfo<void> {
  const MainScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i3.RecommendationsScreenProvider]
class RecommendationsScreenProviderRoute extends _i6.PageRouteInfo<void> {
  const RecommendationsScreenProviderRoute()
      : super(
          RecommendationsScreenProviderRoute.name,
          path: 'recs',
        );

  static const String name = 'RecommendationsScreenProviderRoute';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileScreenRoute extends _i6.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i5.EmptyScreen]
class EmptyScreenRoute extends _i6.PageRouteInfo<void> {
  const EmptyScreenRoute()
      : super(
          EmptyScreenRoute.name,
          path: 'empty',
        );

  static const String name = 'EmptyScreenRoute';
}
