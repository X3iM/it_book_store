import 'package:dio/dio.dart';
import 'package:it_book_store/core/usecases/usecases.dart';
import 'package:it_book_store/features/book_search/data/models/book_detail_result_model.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_detail_result.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/exceptions.dart';

abstract class BookDetailRemoteDataSource {
  Future<BookDetailResultModel>? getBookDetail(Params params);
}

class BookDetailRemoteDataSourceImpl implements BookDetailRemoteDataSource {
  final Dio dio;

  BookDetailRemoteDataSourceImpl({required this.dio});

  @override
  Future<BookDetailResultModel>? getBookDetail(Params params) async {
    if (params is WithParams) {
      final p = params.getParams();
      final response = await dio.get('$API_URL/books/${p!['book_id']}');
      print(response.data);
      if (response.statusCode == 200) {
        return Future.value(BookDetailResultModel.fromJson(response.data));
      } else {
        throw ServerException();
      }
    } else {
      throw ParamsException();
    }
  }
}