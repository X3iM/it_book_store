import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/data/datasource/book_search_remote_data_source.dart';
import 'package:it_book_store/features/book_search/domain/repositories/book_search_repository.dart';
import 'package:it_book_store/features/book_search/domain/usecases/search_book.dart';

import '../../data/repositories/book_search_repository.dart';
import '../bloc/book_bloc/book_event.dart';
import '../bloc/book_bloc/book_search_bloc.dart';


class BookSearchController extends GetxController {
  static const String changedPage = 'changed_page';
  final TextEditingController searchController = TextEditingController(text: '');
  final FocusNode searchFocusNode = FocusNode();

  late BookSearchBloc _bookSearchBloc;
  BookSearchBloc get bookSearchBloc => _bookSearchBloc;

  int? _currentPage;
  int? _totalPage;

  int? get currentPage => _currentPage;
  int? get totalPage => _totalPage;

  @override
  void onInit() {
    super.onInit();

    final BookSearchRepository _searchRepository = BookSearchRepositoryImpl(
      bookSearchRemoteDataSource: BookSearchRemoteDataSourceImpl(),
    );

    _bookSearchBloc = BookSearchBloc(
      searchBook: SearchBook(_searchRepository),
      onNewBookResult: (p0) {
        _currentPage = int.tryParse(p0.page ?? '0') ?? 0;
        _totalPage = ((int.tryParse(p0.total ?? '0') ?? 0) / 10).ceil();
        update([changedPage]);
      },
    );
  }

  void searchBook() {
    _bookSearchBloc.add(GetSearchedBooksEvent(query: searchController.text, page: _currentPage));
  }

  Future newPage() async {
    if ((_currentPage ?? 0) < (totalPage ?? 0)) {
      _currentPage = _currentPage! + 1;
      searchBook();
      update([changedPage]);
    }
  }

  Future prevPage() async {
    if ((_currentPage ?? 0) > 1) {
      _currentPage = _currentPage! - 1;
      searchBook();
      update([changedPage]);
    }
  }

  void newSearch() {
    _currentPage = null;
  }

}