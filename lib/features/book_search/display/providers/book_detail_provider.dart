import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/datasource/book_detail_remote_data_source.dart';
import '../../data/repositories/book_detail_repository.dart';
import '../../domain/entities/book_detail_result.dart';
import '../../domain/repositories/book_detail_repository.dart';

class BookDetailProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  late final BookDetailRepository _bookDetailRepository = BookDetailRepositoryImpl(
      bookDetailRemoteDataSource: BookDetailRemoteDataSourceImpl(dio: _dio)
  );

  bool isSearched = false;

  BookDetailResult? _bookDetailResult;
  BookDetailResult? get bookDetailResult => _bookDetailResult;

  Future getBookDetail({required String bookId}) async {
    isSearched = true;
    notifyListeners();

    Either<Failure, BookDetailResult?>? result = await _bookDetailRepository.getBookDetail(WithParams(params: {'book_id': bookId}));
    result?.fold((l) => null, (r){
      _bookDetailResult = r;
    });

    isSearched = false;
    notifyListeners();
  }

}