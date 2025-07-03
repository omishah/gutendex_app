import 'package:gutendex_app/models/author.dart';

class Book {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final Map<String, String> formats;
  final int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      authors: (json['authors'] as List)
          .map((author) => Author.fromJson(author))
          .toList(),
      subjects: List<String>.from(json['subjects']),
      bookshelves: List<String>.from(json['bookshelves']),
      languages: List<String>.from(json['languages']),
      copyright: json['copyright'],
      mediaType: json['media_type'],
      formats: Map<String, String>.from(json['formats']),
      downloadCount: json['download_count'],
    );
  }

  String? get bookCoverImageUrl => formats['image/jpeg'];

  String? get readableLink {
    return formats['text/html'] ??
        formats['application/pdf'] ??
        formats['text/plain'];
  }

  String get authorName => authors.isNotEmpty ? authors.first.name : 'N/A';
}
