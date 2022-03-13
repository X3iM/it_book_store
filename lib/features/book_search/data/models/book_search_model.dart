import 'package:it_book_store/features/book_search/data/models/book_model.dart';

import '../../domain/entities/book.dart';
import '../../domain/entities/book_search_result.dart';

class BookSearchModel extends BookSearchResult {
  BookSearchModel({
    required String error,
    String? total,
    String? page,
    List<Book>? books
  }) : super(
      error: error,
      total: total,
      page: page,
      books: books
  );

  factory BookSearchModel.fromJson(Map<String, dynamic> json) => BookSearchModel(
      error: json['error'],
      total: json['total'],
      page: json['page'],
      books: json['books'] != null ? (json['books'] as List).map((e) => BookModel.fromJson(e)).toList() : null
  );

  Map<String, dynamic> toJson() => {
    'error': error,
    'total': total,
    'page': page,
    'books': books?.map((e) => (e as BookModel).toJson()).toString(),
  };

}