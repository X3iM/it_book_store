import 'book.dart';

class BookSearchResult {
  final String error;
  final String? total;
  final String? page;
  final List<Book>? books;

  BookSearchResult({
    required this.error,
    required this.total,
    this.page,
    this.books});
}