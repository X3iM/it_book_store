import 'package:it_book_store/core/errors/exceptions.dart';

import 'package:it_book_store/core/usecases/usecases.dart';
import 'package:it_book_store/features/book_search/data/models/book_search_model.dart';

import '../../../../core/network/network_service.dart';

abstract class BookSearchRemoteDataSource {
  Future<BookSearchResultModel>? searchBook(Params params);
}

class BookSearchRemoteDataSourceImpl extends NetworkService implements BookSearchRemoteDataSource {

  @override
  Future<BookSearchResultModel>? searchBook(Params params) async {
    if (params is WithParams) {
      final p = params.getParams();
      String url = '/search/${p!['book_id']}';
      if (p['page'] != null) {
        url += '/${p['page']}';
      }
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return Future.value(BookSearchResultModel.fromJson(response.data));
      } else {
        throw ServerException();
      }
    } else {
      throw ParamsException();
    }
  }

}