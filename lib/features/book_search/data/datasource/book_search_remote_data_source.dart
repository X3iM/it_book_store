import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:it_book_store/core/constants.dart';
import 'package:it_book_store/core/errors/exceptions.dart';

import 'package:it_book_store/core/usecases/usecases.dart';
import 'package:it_book_store/features/book_search/data/models/book_search_model.dart';

abstract class BookSearchRemoteDataSource {
  Future<BookSearchModel>? searchBook(Params params);
}

class BookSearchRemoteDataSourceImpl implements BookSearchRemoteDataSource {
  final Dio dio;

  BookSearchRemoteDataSourceImpl({required this.dio});

  @override
  Future<BookSearchModel>? searchBook(Params params) async {
    if (params is WithParams) {
      final p = params.getParams();
      String url = '$API_URL/search/${p!['query']}';
      if (p['page'] != null) {
        url += '/${p['page']}';
      }
      final response = await dio.get(url);
      // print(response.data);
      if (response.statusCode == 200) {
        return Future.value(BookSearchModel.fromJson(response.data));
      } else {
        throw ServerException();
      }
    } else {
      throw ParamsException();
    }
  }

}