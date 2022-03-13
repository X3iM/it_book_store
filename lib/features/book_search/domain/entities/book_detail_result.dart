import 'book_detail.dart';

class BookDetailResult {
  final String error;
  final BookDetail? bookDetail;

  BookDetailResult({
    required this.error,
    this.bookDetail});
}