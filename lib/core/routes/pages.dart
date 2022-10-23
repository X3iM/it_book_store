import 'package:get/get.dart';
import 'package:it_book_store/features/book_search/display/pages/search_page.dart';

import '../../features/book_search/display/pages/book_detail_page.dart';
import '../utils/constants.dart';
import 'routes.dart';

class Pages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.SEARCH_SCREEN,
        page: () => const SearchPage(),
        transition: Transition.native,
        transitionDuration: duration,
      ),
      GetPage(
        name: Routes.BOOK_DETAILS_SCREEN,
        page: () => const BookDetailPage(),
        transition: Transition.native,
        transitionDuration: duration,
      ),
    ];
  }
}
