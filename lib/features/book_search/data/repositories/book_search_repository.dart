import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/data/datasource/book_search_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../domain/entities/book_search_result.dart';
import '../../domain/repositories/book_search_repository.dart';

class BookSearchRepositoryImpl implements BookSearchRepository {
  final BookSearchRemoteDataSource bookSearchRemoteDataSource;

  BookSearchRepositoryImpl({required this.bookSearchRemoteDataSource});

  @override
  Future<Either<Failure, BookSearchResult?>>? searchBook(Params params) async {
    try {
      return Right(await bookSearchRemoteDataSource.searchBook(params));
    } on Exception catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(errorMessage: 'server_failure'.tr));
      } else if (e is ParamsException) {
        return Left(ParamsFailure(errorMessage: 'parameters_failure'.tr));
      } else {
        return Left(UnknownFailure(errorMessage: 'unknown_failure'.tr));
      }
    }
  }

}