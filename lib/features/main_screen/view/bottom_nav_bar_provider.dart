import 'package:busy_reader/features/main_screen/bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_bar.dart';

class BottomNavBarProvider extends StatelessWidget {
  const BottomNavBarProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarBloc(),
      child: const BottomNavBar(),
    );
  }
}
