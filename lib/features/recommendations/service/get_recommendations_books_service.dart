import "dart:convert";

abstract class GetRecommendationsBookServiceGlobal {
  Future<Map<String, dynamic>> getBooks();
}

class GetRecommendationsBookServiceMock
    implements GetRecommendationsBookServiceGlobal {
  @override
  Future<Map<String, dynamic>> getBooks() async {
    await Future.delayed(const Duration(seconds: 3));
    return jsonDecode('''{
      "data" : [
        {
          "name" : "Rita Hayworth and Shawshank Redemption",
          "year" : 1982,
          "author" : "Stephen King",
          "image" : "https://img3.labirint.ru/rc/9bbf9fe9fd235a2400cbbcdef56560c3/363x561q80/books81/801369/cover.jpg?1619069114",
          "description" : "Страшный сон, ставший реальностью... История невинного человека, приговоренного к пожизненному заключению в тюремном аду. Жесткая история выживания там, где выжить практически невозможно. Увлекательная история побега оттуда, откуда не сумел вырваться еще никто..."
        },
        {
          "name" : "Мы",
          "year" : 1988,
          "author" : "Евгений Замятин",
          "image" : "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Мы_%28роман%29.jpg/524px-Мы_%28роман%29.jpg",
          "description" : "Действие разворачивается приблизительно в тридцать втором веке. Этот роман описывает общество жёсткого тоталитарного контроля над личностью (имена и фамилии заменены буквами и номерами, государство контролирует даже интимную жизнь), идейно основанное на тейлоризме, сциентизме и отрицании фантазии, управляемое «избираемым» на безальтернативной основе «Благодетелем»."
        },
        {
          "name" : "Последнее желание",
          "year" : 1993,
          "author" : "Анджей Сапковский",
          "image" : "https://upload.wikimedia.org/wikipedia/ru/9/9a/Ostatnie_życzenie.jpg",
          "description" : "Это первое произведение из цикла «Ведьмак» как по хронологии, так и по времени написания. От первого издания в виде книги «Ведьмак» «Последнее желание» отличается связующей серией интерлюдий «Глас рассудка» и наличием рассказов «Последнее желание» и «Край света»."
        }
      ]
    }''');
  }
}
