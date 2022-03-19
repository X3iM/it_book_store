import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:it_book_store/core/errors/failures.dart';
import 'package:it_book_store/core/usecases/usecases.dart';
import 'package:it_book_store/features/book_search/data/datasource/book_search_remote_data_source.dart';
import 'package:it_book_store/features/book_search/domain/repositories/book_search_repository.dart';
import 'package:it_book_store/features/book_search/domain/usecases/search_book.dart';

import '../../data/repositories/book_search_repository.dart';
import '../../domain/entities/book_search_result.dart';


class BookSearchProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final TextEditingController searchController = TextEditingController(text: '');
  late final BookSearchRepository _searchRepository = BookSearchRepositoryImpl(
      bookSearchRemoteDataSource: BookSearchRemoteDataSourceImpl(dio: _dio)
  );
  final FocusNode searchFocusNode = FocusNode();

  bool isSearched = false;

  int? _currentPage;
  int? get currentPage => _currentPage;
  int? _totalPage;
  int? get totalPage => _totalPage;

  BookSearchResult? _bookSearchModel;
  BookSearchResult? get bookSearchModel => _bookSearchModel;

  Future searchBook() async {
    isSearched = true;
    notifyListeners();

    WithParams params = WithParams(params: {'query': searchController.text,});
    if (_currentPage != null) {
      params.params['page'] = _currentPage;
    }
    Either<Failure, BookSearchResult?>? result = await SearchBook(_searchRepository)(params);
    result?.fold((l) {
      _currentPage = null;
      _totalPage = null;
    }, (r) {
      _bookSearchModel = r;
      if (_bookSearchModel?.books != null) {
        _currentPage = int.parse(_bookSearchModel!.page ?? '0');
        _totalPage = (int.parse(_bookSearchModel!.total ?? '0') / 10).ceil();
      }
    });
    isSearched = false;
    notifyListeners();
  }

  Future newPage() async {
    if (_currentPage! < _totalPage!) {
      _currentPage = _currentPage! + 1;
      await searchBook();
    }
  }

  Future prevPage() async {
    if (_currentPage! > 1) {
      _currentPage = _currentPage! - 1;
      await searchBook();
    }
  }

  void newSearch() {
    _currentPage = null;
    _totalPage = null;
  }

}