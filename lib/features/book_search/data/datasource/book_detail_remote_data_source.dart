import 'package:it_book_store/core/usecases/usecases.dart';
import 'package:it_book_store/features/book_search/data/models/book_detail_result_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_service.dart';

abstract class BookDetailRemoteDataSource {
  Future<BookDetailResultModel>? getBookDetail(Params params);
}

class BookDetailRemoteDataSourceImpl extends NetworkService implements BookDetailRemoteDataSource {

  @override
  Future<BookDetailResultModel>? getBookDetail(Params params) async {
    if (params is WithParams) {
      final p = params.getParams();
      final response = await dio.get('/books/${p!['book_id']}');
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