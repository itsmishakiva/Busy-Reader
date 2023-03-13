import 'package:busy_reader/features/recommendations/bloc/recommendations_bloc.dart';
import 'package:busy_reader/features/recommendations/view/widgets/book_bottom_sheet.dart';
import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/book.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({
    super.key,
    required this.book,
    required this.bloc,
  });

  final Book book;
  final RecommendationsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          barrierColor: const Color(0x99282828),
          backgroundColor: Colors.transparent,
          builder: (context) => BookBottomSheet(
            book: book,
            bloc: bloc,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 48,
              height: 78,
              child: Image.network(
                book.imagePath,
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
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    style: context.textStyles.headline3,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    book.year.toString(),
                    style: context.textStyles.subtitle2!.copyWith(
                      color: context.colors.hintColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    book.author,
                    style: context.textStyles.headline4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SvgPicture.asset(
              book.favorite
                  ? 'assets/icons/filled_heart.svg'
                  : 'assets/icons/heart.svg',
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
