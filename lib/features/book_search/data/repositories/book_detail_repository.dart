import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/data/datasource/book_detail_remote_data_source.dart';


import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../domain/entities/book_detail_result.dart';
import '../../domain/repositories/book_detail_repository.dart';

class BookDetailRepositoryImpl implements BookDetailRepository {
  final BookDetailRemoteDataSource bookDetailRemoteDataSource;

  BookDetailRepositoryImpl({required this.bookDetailRemoteDataSource});

  @override
  Future<Either<Failure, BookDetailResult?>>? getBookDetail(Params params) async {
    try {
      return Right(await bookDetailRemoteDataSource.getBookDetail(params));
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