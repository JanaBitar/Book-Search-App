import 'dart:convert';

class Book {
  final int id;
  final String title;
  final String author;
  final String genre;
  final int publishedYear;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.publishedYear,
  });

  // Factory constructor to create a Book from a JSON object
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: int.parse(json['id']),
      title: json['title'],
      author: json['author'],
      genre: json['genre'],
      publishedYear: int.parse(json['published_year']),
    );
  }

  @override
  String toString() {
    return 'Title: $title\nAuthor: $author\nGenre: $genre\nYear: $publishedYear';
  }
}

// Function to parse a list of books from JSON
List<Book> parseBooks(String responseBody) {
  final List<dynamic> parsed = json.decode(responseBody);
  return parsed.map<Book>((json) => Book.fromJson(json)).toList();
}
