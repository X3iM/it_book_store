import 'package:dartz/dartz.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_search_result.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/book_search_repository.dart';


class SearchBook {
  final BookSearchRepository repository;

  SearchBook(this.repository);

  Future<Either<Failure, BookSearchResult?>?> call(Params params) async {
    return await repository.searchBook(params);
  }
}