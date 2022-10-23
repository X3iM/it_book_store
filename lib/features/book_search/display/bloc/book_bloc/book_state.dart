import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_detail_result.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_search_result.dart';

@immutable
abstract class BookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends BookState {}

class Loading extends BookState {}

class LoadedSearchedBooks extends BookState {
  final BookSearchResult bookSearchResult;

  LoadedSearchedBooks({required this.bookSearchResult});

  @override
  List<Object> get props => [bookSearchResult];
}

class LoadedBookDetails extends BookState {
  final BookDetailResult bookDetailResult;

  LoadedBookDetails({required this.bookDetailResult});

  @override
  List<Object> get props => [bookDetailResult];
}

class Error extends BookState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
