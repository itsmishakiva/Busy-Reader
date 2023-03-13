import 'package:auto_route/auto_route.dart';
import 'package:busy_reader/features/main_screen/bloc/bottom_nav_bar_bloc.dart';
import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.tabsRouter.addListener(() {
      context.read<BottomNavBarBloc>().add(
        BottomNavBarChangedIndex(index: context.tabsRouter.activeIndex),
      );
    });
    return BlocBuilder<BottomNavBarBloc, int>(builder: (context, value) {
      return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: context.textStyles.bottomNavBarText,
        unselectedLabelStyle: context.textStyles.bottomNavBarText,
        selectedItemColor: context.colors.accentColor,
        unselectedItemColor: context.colors.hintColor,
        currentIndex: value,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          context.tabsRouter.setActiveIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tabs_home.svg',
              colorFilter: ColorFilter.mode(
                context.colors.hintColor!,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/tabs_home.svg',
              colorFilter: ColorFilter.mode(
                context.colors.accentColor!,
                BlendMode.srcIn,
              ),
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tabs_search.svg',
              colorFilter: ColorFilter.mode(
                context.colors.hintColor!,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/tabs_search.svg',
              colorFilter: ColorFilter.mode(
                context.colors.accentColor!,
                BlendMode.srcIn,
              ),
            ),
            label: AppLocalizations.of(context)!.search,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: ColorFilter.mode(
                context.colors.hintColor!,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: ColorFilter.mode(
                context.colors.accentColor!,
                BlendMode.srcIn,
              ),
            ),
            label: AppLocalizations.of(context)!.saved,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tabs_profile.svg',
              colorFilter: ColorFilter.mode(
                context.colors.hintColor!,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/tabs_profile.svg',
              colorFilter: ColorFilter.mode(
                context.colors.accentColor!,
                BlendMode.srcIn,
              ),
            ),
            label: AppLocalizations.of(context)!.account,
          ),
        ],
      );
    });
  }
}
