import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/book_search_result.dart';

abstract class BookSearchRepository {
  Future<Either<Failure, BookSearchResult?>>? searchBook(Params params);
}