class Book {
  const Book({
    required this.imagePath,
    required this.name,
    required this.year,
    required this.author,
    required this.description,
    this.favorite = false,
  });

  final String imagePath;
  final String name;
  final int year;
  final String author;
  final String description;
  final bool favorite;

  factory Book.fromJson(Map<String, dynamic> result) {
    return Book(
      imagePath: result['image'],
      name: result['name'],
      year: result['year'],
      author: result['author'],
      description: result['description'],
      favorite: result['favorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image' : imagePath,
      'name' : name,
      'year' : year,
      'author' : author,
      'description' : description,
      'favorite' : favorite,
    };
  }

  @override
  int get hashCode => identityHashCode(name + year.toString() + author);

  @override
  bool operator ==(Object other) {
    if (other is! Book) return false;
    if (other.hashCode == hashCode) return true;
    return false;
  }

  Book copyWith({
    String? imagePath,
    String? name,
    int? year,
    String? author,
    String? description,
    bool? favorite,
  }) {
    return Book(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      year: year ?? this.year,
      author: author ?? this.author,
      description: description ?? this.description,
      favorite: favorite ?? this.favorite,
    );
  }
}
