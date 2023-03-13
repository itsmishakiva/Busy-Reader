import 'package:busy_reader/features/recommendations/bloc/recommendations_bloc.dart';
import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/book.dart';

class BookBottomSheet extends StatelessWidget {
  const BookBottomSheet({Key? key, required this.book, required this.bloc})
      : super(key: key);
  final Book book;
  final RecommendationsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsBloc, List<Book>?>(
        bloc: bloc,
        builder: (context, value) {
          Book updateBook = book;
          if (value != null) {
            for (var val in value) {
              if (book == val) {
                updateBook = val;
              }
            }
          }
          return Container(
            padding: EdgeInsets.fromLTRB(
                16, 16, 16, 24 + MediaQuery.of(context).padding.bottom),
            decoration: BoxDecoration(
              color: context.colors.backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.redactionChoice,
                      style: context.textStyles.headline2,
                    ),
                    const Spacer(),
                    const Icon(Icons.close),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 160,
                      child: Image.network(
                        updateBook.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, e, stackTrace) {
                          return SvgPicture.asset(
                            'assets/logo/logo.svg',
                            fit: BoxFit.cover,
                          );
                        },
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) {
                            return child;
                          }
                          return Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: context.colors.textSecondaryColor,
                                strokeWidth: 3,
                                value: progress.expectedTotalBytes == null
                                    ? null
                                    : progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes!,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            updateBook.name,
                            style: context.textStyles.headline3,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            updateBook.year.toString(),
                            style: context.textStyles.subtitle2!.copyWith(
                              color: context.colors.hintColor,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            updateBook.author,
                            style: context.textStyles.headline4,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            updateBook.description,
                            maxLines: 5,
                            style: context.textStyles.subtitle2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    height: 48,
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.colors.accentColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        bloc.add(SetBookFavorite(book: updateBook));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/heart.svg',
                            colorFilter: ColorFilter.mode(
                              context.colors.backgroundColor!,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            updateBook.favorite
                                ? AppLocalizations.of(context)!.removeSaved
                                : AppLocalizations.of(context)!.addToSaved,
                            style: context.textStyles.button,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
