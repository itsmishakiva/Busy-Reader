import 'package:auto_route/annotations.dart';
import 'package:busy_reader/features/profile/view/profile_screen.dart';
import 'package:busy_reader/features/recommendations/view/recommendations_screen.dart';
import 'package:busy_reader/features/recommendations/view/recommendations_screen_provider.dart';
import 'package:busy_reader/features/splash/view/splash_screen.dart';

import '../features/empty/empty_screen.dart';
import '../features/main_screen/view/main_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true, path: 'splash'),
  AutoRoute(
    page: MainScreen,
    path: 'main',
    children: [
      AutoRoute(page: RecommendationsScreenProvider, path: 'recs'),
      AutoRoute(page: ProfileScreen, path: 'profile'),
      AutoRoute(page: EmptyScreen, path: 'empty'),
    ],
  ),
])
class $AppRouter {}
