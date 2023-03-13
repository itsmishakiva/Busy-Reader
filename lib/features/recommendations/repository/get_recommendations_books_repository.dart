import 'package:hive/hive.dart';

import '../models/book.dart';
import '../service/get_recommendations_books_service.dart';

class GetRecommendationsBooksRepository {
  final GetRecommendationsBookServiceGlobal service;

  GetRecommendationsBooksRepository({required this.service});

  Future<List<Book>> getBooks() async {
    await Hive.openBox('books');
    Box box = Hive.box('books');
    final List<dynamic>? results = (await service.getBooks())['data'];
    final List<Book> books = [];
    results?.forEach((element) {
      final book = Book.fromJson(element);
      books.add(book);
    });
    List? local = box.get('books');
    if (local != null) {
      for (var element in local) {
        final b = Book(
          imagePath: element['image'],
          name: element['name'],
          author: element['author'],
          favorite: element['favorite'],
          description: element['description'],
          year: element['year'],
        );
        if (!books.contains(b)) {
          books.add(b);
        } else {
          for (int i = 0; i < books.length; i++) {
            if (books[i] == b) books[i] = b;
          }
        }
      }
    }
    box.put('books', books.map((e) => e.toJson()).toList());
    return books;
  }

  Future<List<Book>> setBookFavorite(Book book) async {
    await Hive.openBox('books');
    Box box = Hive.box('books');
    List<Map<String, dynamic>> books = box.get('books');
    for (int i = 0; i < books.length; i++) {
      final gotBook = Book.fromJson(books[i]);
      if (gotBook == book) {
        books[i] = book.copyWith(favorite: !book.favorite).toJson();
      }
    }
    box.put('books', books);
    return books.map((e) => Book.fromJson(e)).toList();
  }
}
