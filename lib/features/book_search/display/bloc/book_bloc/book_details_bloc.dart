import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../../domain/usecases/get_detail_book.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookDetailsBloc extends Bloc<BookEvent, BookState> {
  final GetDetailsBook getBookDetailResult;

  BookDetailsBloc({
    required this.getBookDetailResult,
  }) : super(Empty()) {
    on<GetBookDetailsEvent>(_onGetGetBookDetailsEvent);
  }

  _onGetGetBookDetailsEvent(GetBookDetailsEvent event, Emitter<BookState> emit) async {
    emit(Loading());
    final failureOrWeather = await getBookDetailResult(WithParams(params: {
      'book_id': event.bookId,
    },),);
    failureOrWeather?.fold(
      (failure) => emit(Error(message: failure.errorMessage ?? "")),
      (details) {
        if (details != null) {
          emit(LoadedBookDetails(bookDetailResult: details));
        } else {
          emit(Error(message: 'error'.tr));
        }
      },
    );
  }

}