import 'package:it_book_store/features/book_search/data/models/book_detail_model.dart';

import '../../domain/entities/book_detail.dart';
import '../../domain/entities/book_detail_result.dart';

class BookDetailResultModel extends BookDetailResult {
  BookDetailResultModel({
    required String error,
    BookDetail? bookDetail,
  }) : super(
      error: error,
      bookDetail: bookDetail
  );

  factory BookDetailResultModel.fromJson(Map<String, dynamic> json) => BookDetailResultModel(
      error: json['error'],
      bookDetail: BookDetailModel.fromJson(json)
  );

  Map<String, dynamic> toJson() => {
    'error': error,
    'bookDetail': (bookDetail as BookDetailModel).toJson()
  };

}