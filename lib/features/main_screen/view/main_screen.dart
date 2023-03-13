import 'package:auto_route/auto_route.dart';
import 'package:busy_reader/navigation/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/custom_scaffold.dart';
import 'bottom_nav_bar_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        RecommendationsScreenProviderRoute(),
        EmptyScreenRoute(),
        EmptyScreenRoute(),
        ProfileScreenRoute(),
      ],
      builder: (context, child, _) {
        return CustomScaffold(
          bottomNavigationBar: const BottomNavBarProvider(),
          body: child,
        );
      },
    );
  }
}
