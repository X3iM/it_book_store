import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/book_detail_result.dart';

abstract class BookDetailRepository {
  Future<Either<Failure, BookDetailResult?>>? getBookDetail(Params params);
}