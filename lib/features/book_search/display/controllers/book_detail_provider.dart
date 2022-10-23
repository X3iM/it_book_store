import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/domain/usecases/get_detail_book.dart';

import '../../data/datasource/book_detail_remote_data_source.dart';
import '../../data/repositories/book_detail_repository.dart';
import '../../domain/repositories/book_detail_repository.dart';
import '../bloc/book_bloc/book_details_bloc.dart';
import '../bloc/book_bloc/book_event.dart';

class BookDetailController extends GetxController {
  late BookDetailsBloc _bookDetailsBloc;
  BookDetailsBloc get bookDetailsBloc => _bookDetailsBloc;

  @override
  void onInit() {
    super.onInit();

    final BookDetailRepository _bookDetailRepository = BookDetailRepositoryImpl(
      bookDetailRemoteDataSource: BookDetailRemoteDataSourceImpl(),
    );

    _bookDetailsBloc = BookDetailsBloc(
      getBookDetailResult: GetDetailsBook(_bookDetailRepository),
    );
  }

  void getBookDetail({required String bookId}) {
    _bookDetailsBloc.add(GetBookDetailsEvent(bookId: bookId));
  }

}