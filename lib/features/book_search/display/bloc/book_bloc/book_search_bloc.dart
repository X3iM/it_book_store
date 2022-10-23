import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/display/bloc/book_bloc/book_event.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_search_result.dart';

import '../../../../../core/usecases/usecases.dart';
import '../../../domain/usecases/search_book.dart';
import 'book_state.dart';


class BookSearchBloc extends Bloc<BookEvent, BookState> {
  final SearchBook searchBook;
  final Function(BookSearchResult) onNewBookResult;

  BookSearchBloc({
    required this.searchBook,
    required this.onNewBookResult,
  }) : super(Empty()) {
    on<GetSearchedBooksEvent>(_onGetSearchedBooksEvent);
  }

  _onGetSearchedBooksEvent(GetSearchedBooksEvent event, Emitter<BookState> emit) async {
    emit(Loading());
    final failureOrWeather = await searchBook(WithParams(params: {
      'query': event.query,
      'page': event.page,
    }));
    failureOrWeather?.fold(
      (failure) => emit(Error(message: failure.errorMessage ?? "")),
      (books) {
        if (books != null) {
          emit(LoadedSearchedBooks(bookSearchResult: books));
          onNewBookResult(books);
        } else {
          emit(Error(message: 'error'.tr));
        }
      },
    );
  }

}