import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:it_book_store/core/utils/constants.dart';
import 'package:it_book_store/core/widgets/input_widgets.dart';
import 'package:it_book_store/features/book_search/display/bloc/book_bloc/book_search_bloc.dart';
import 'package:it_book_store/features/book_search/display/bloc/book_bloc/book_state.dart';
import 'package:it_book_store/features/book_search/display/controllers/book_detail_provider.dart';
import 'package:it_book_store/features/book_search/display/widgets/custom_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/routes.dart';
import '../../domain/entities/book.dart';
import '../controllers/book_search_provider.dart';
import '../widgets/it_book_app_bar.dart';
import '../widgets/paginate_widget.dart';

class SearchPage extends GetView<BookSearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        if (controller.searchFocusNode.hasFocus) {
          controller.searchFocusNode.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              ItBookAppBar(title: 'app_title'.tr,),
              SizedBox(height: smallVerticalPadding,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: NeumorphismInputWidget(
                  controller: controller.searchController,
                  textInputAction: TextInputAction.search,
                  onEditingComplete: () {
                    controller.newSearch();
                    controller.searchBook();
                  },
                  focusNode: controller.searchFocusNode,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.newSearch();
                      controller.searchBook();
                    },
                    child: const Icon(Icons.search_rounded),
                  ),
                  hint: 'search'.tr,
                ),
              ),
              // SizedBox(height: size.height * .02),
              Expanded(
                child: BlocBuilder<BookSearchBloc, BookState>(
                  bloc: controller.bookSearchBloc,
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is LoadedSearchedBooks && state.bookSearchResult.books?.isNotEmpty == true) {
                      return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.bookSearchResult.books!.length,
                                itemBuilder: (context, index) => bookCard(state.bookSearchResult.books![index]),
                              ),
                            ),
                            GetBuilder<BookSearchController>(
                              id: BookSearchController.changedPage,
                              builder: (controller) {
                                if (controller.currentPage != null) {
                                  return PaginateWidget(
                                    currentPage: controller.currentPage!,
                                    maxPage: controller.totalPage!,
                                    nextPage: () {
                                      controller.newPage();
                                    },
                                    prevPage: () {
                                      controller.prevPage();
                                    },
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ]
                      );
                      // return const Expanded(child: Center(child: Text('Search IT books'),));
                    } else if (state is Error) {
                      return Center(
                        child: Text(state.message,
                          style: Get.textTheme.headline1,),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + verticalPadding),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookCard(Book book) {
    return CustomCard(
      onTap: () {
        Get.find<BookDetailController>().getBookDetail(bookId: book.isbn13);
        Get.toNamed(Routes.BOOK_DETAILS_SCREEN);
      },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  book.image,
                  width: Get.width * .4,
                  height: Get.height * .2,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                        width: Get.width * .4,
                        height: Get.height * .2,
                        child: const Center(child: CircularProgressIndicator.adaptive(),),
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: verticalPadding),
                      Text(
                        book.title,
                        style: Get.textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        book.subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 10),
                      Text(book.price, style: Get.textTheme.bodyText1),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

}
