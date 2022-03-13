import 'package:flutter/material.dart';
import 'package:it_book_store/core/widgets/input_widgets.dart';
import 'package:it_book_store/features/book_search/display/providers/book_detail_provider.dart';
import 'package:it_book_store/features/book_search/display/providers/book_search_provider.dart';
import 'package:it_book_store/features/book_search/display/widgets/custom_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme.dart';
import '../widgets/it_book_app_bar.dart';
import '../widgets/paginate_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookSearchProvider provider = context.read<BookSearchProvider>();
    Size size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData.light(),
      child: Listener(
        onPointerDown: (_) {
          if (provider.searchFocusNode.hasFocus) {
            provider.searchFocusNode.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                ItBookAppBar(title: 'IT Book',),
                SizedBox(height: size.height * .01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: NeumorphismInputWidget(
                    controller: provider.searchController,
                    textInputAction: TextInputAction.search,
                    onEditingComplete: () {
                      provider.newSearch();
                      provider.searchBook();
                    },
                    focusNode: provider.searchFocusNode,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        provider.newSearch();
                        provider.searchBook();
                      },
                      child: const Icon(Icons.search_rounded),
                    ),
                    hint: 'Search...',
                  ),
                ),
                // SizedBox(height: size.height * .02),
                Expanded(
                  child: Consumer<BookSearchProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          if (provider.isSearched)
                            const Expanded(child: Center(child: CircularProgressIndicator.adaptive(),))
                          else if (provider.bookSearchModel?.books?.isNotEmpty == true)
                            Expanded(
                              child: ListView.builder(
                                itemCount: provider.bookSearchModel!.books!.length,
                                itemBuilder: (context, index) => bookCard(provider, index, context, size),
                              ),
                            )
                          else if (provider.bookSearchModel?.books?.isEmpty == true)
                            const Expanded(child: Center(child: Text('Books not found'),))
                          else if (!provider.isSearched && provider.bookSearchModel == null)
                                const Expanded(child: Center(child: Text('Search IT books'),)),
                          if (provider.currentPage != null)
                            PaginateWidget(
                              currentPage: provider.currentPage!,
                              maxPage: provider.totalPage!,
                              nextPage: () {
                                provider.newPage();
                              },
                              prevPage: () {
                                provider.prevPage();
                              },
                              size: size,
                            ),
                        ]
                      );
                      // return const Expanded(child: Center(child: Text('Search IT books'),));
                    },
                  ),
                ),
                SizedBox(height: size.height * .05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bookCard(BookSearchProvider provider, int index, BuildContext context, Size size) {
    return CustomCard(
      onTap: () {
        context.read<BookDetailProvider>().getBookDetail(bookId: provider.bookSearchModel!.books![index].isbn13);
        Navigator.of(context).pushNamed('book_detail_page');
      },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  provider.bookSearchModel!.books![index].image,
                  width: size.width * .4,
                  height: 180,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                        width: size.width * .4,
                        height: size.height * .3,
                        child: AppWidgets.loader
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        provider.bookSearchModel!.books![index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        provider.bookSearchModel!.books![index].subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 10),
                      Text(provider.bookSearchModel!.books![index].price),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

}
