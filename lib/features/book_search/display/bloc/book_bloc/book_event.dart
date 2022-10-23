import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSearchedBooksEvent extends BookEvent {
  final String query;
  final int? page;

  GetSearchedBooksEvent({
    required this.query,
    this.page,
  });

  @override
  List<Object?> get props => [query, page];
}

class GetBookDetailsEvent extends BookEvent {
  final String bookId;

  GetBookDetailsEvent({
    required this.bookId,
  });

  @override
  List<Object?> get props => [bookId];
}
