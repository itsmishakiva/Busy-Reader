import 'package:auto_route/auto_route.dart';
import 'package:busy_reader/features/common/custom_scaffold.dart';
import 'package:busy_reader/navigation/router.gr.dart';
import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      context.router.pushAndPopUntil(
        const MainScreenRoute(),
        predicate: (route) {
          if (route is MainScreenRoute) {
            return true;
          }
          return false;
        },
      );
    });
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.appTitle,
              style: context.textStyles.headline1!,
            ),
            const SizedBox(height: 8),
            SvgPicture.asset(
              'assets/logo/logo.svg',
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
