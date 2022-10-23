import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/display/controllers/book_detail_provider.dart';
import 'package:it_book_store/features/book_search/display/controllers/book_search_provider.dart';

class MainBinding implements Bindings {

  @override
  Future<void> dependencies() async {
    Get.put<BookSearchController>(BookSearchController());
    Get.put<BookDetailController>(BookDetailController());
  }

}