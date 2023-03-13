import 'package:busy_reader/features/recommendations/repository/get_recommendations_books_repository.dart';
import 'package:busy_reader/features/recommendations/service/get_recommendations_books_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book.dart';

abstract class RecommendationsEvent {}

class GetRecommendationsList extends RecommendationsEvent {
  GetRecommendationsList({required this.newList});

  List<Book> newList;
}

class SetBookFavorite extends RecommendationsEvent {
  SetBookFavorite({required this.book});

  Book book;
}

class RecommendationsBloc extends Bloc<RecommendationsEvent, List<Book>?> {
  RecommendationsBloc() : super(null) {
    on<GetRecommendationsList>((event, emit) {
      emit(event.newList);
    });
    on<SetBookFavorite>((event, emit) async {
      final result = await repo.setBookFavorite(event.book);
      emit(result);
    });
  }

  final repo = GetRecommendationsBooksRepository(
    service: GetRecommendationsBookServiceMock(),
  );

  Future<void> getList() async {
    add(GetRecommendationsList(newList: await repo.getBooks()));
  }

}
