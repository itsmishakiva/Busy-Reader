import 'package:busy_reader/features/recommendations/bloc/recommendations_bloc.dart';
import 'package:busy_reader/features/recommendations/view/widgets/book_list_tile.dart';
import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/book.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.recs,
                  style: context.textStyles.headline2,
                ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.allBooks,
                  style: context.textStyles.subtitle,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: BlocBuilder<RecommendationsBloc, List<Book>?>(
                builder: (context, value) {
              if (value == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: context.colors.accentColor,
                  ),
                );
              }
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  child: BookListTile(
                    book: value[index],
                    bloc: context.read(),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
