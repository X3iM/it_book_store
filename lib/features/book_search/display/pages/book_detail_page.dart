import 'package:flutter/material.dart';
import 'package:it_book_store/features/book_search/display/providers/book_detail_provider.dart';
import 'package:it_book_store/features/book_search/display/widgets/custom_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/icon_shadow.dart';
import '../widgets/it_book_app_bar.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Theme(
        data: ThemeData.light(),
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: Column(
                    children: [
                      ItBookAppBar(title: 'IT Book', leading: IconButton(
                        onPressed: () => Navigator.pop(context),
                        splashRadius: 28,
                        icon: const IconShadow(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )),
                      SizedBox(height: size.height * .01),
                      Consumer<BookDetailProvider>(
                          builder: (BuildContext context, provider, Widget? child) {
                            if (provider.isSearched) {
                              return const Center(child: CircularProgressIndicator.adaptive(),);
                            } else if (provider.bookDetailResult?.bookDetail != null) {
                              return CustomCard(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          provider.bookDetailResult!.bookDetail!.image,
                                          width: size.width * .45,
                                          height: size.height * .25,
                                          fit: BoxFit.fill,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return SizedBox(
                                                width: size.width * .45,
                                                height: size.height * .25,
                                                child: AppWidgets.loader
                                            );
                                            },
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 26),
                                              Text(
                                                provider.bookDetailResult!.bookDetail!.title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(provider.bookDetailResult!.bookDetail!.subtitle,),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 26),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Year: ' + provider.bookDetailResult!.bookDetail!.year),
                                                const SizedBox(height: 10),
                                                Text('Rating: ' + provider.bookDetailResult!.bookDetail!.rating),
                                                const SizedBox(height: 10),
                                                Text('Pages: ' + provider.bookDetailResult!.bookDetail!.pages),
                                                const SizedBox(height: 10),
                                                Text('Publisher: ' + provider.bookDetailResult!.bookDetail!.publisher),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: Text(
                                                'Price: ' + provider.bookDetailResult!.bookDetail!.price,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              );
                            } else {
                              return Center(child: Text('Failed to get book details'),);
                            }
                          }
                          ),
                    ],
              )
              ),
            ),
          ),
        );
  }

}
