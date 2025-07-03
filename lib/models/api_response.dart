import 'book.dart';

class ApiResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Book> results;

  ApiResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((bookJson) => Book.fromJson(bookJson))
          .toList(),
    );
  }
}
