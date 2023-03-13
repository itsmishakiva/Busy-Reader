import 'package:busy_reader/features/recommendations/bloc/recommendations_bloc.dart';
import 'package:busy_reader/features/recommendations/view/recommendations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationsScreenProvider extends StatelessWidget {
  const RecommendationsScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendationsBloc()..getList(),
      child: const RecommendationsScreen(),
    );
  }
}
