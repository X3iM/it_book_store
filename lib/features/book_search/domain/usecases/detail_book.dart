import 'package:dartz/dartz.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_detail_result.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/book_detail_repository.dart';

class DetailBook {
  final BookDetailRepository repository;

  DetailBook(this.repository);

  Future<Either<Failure, BookDetailResult?>?> call(Params params) async {
    return await repository.getBookDetail(params);
  }
}