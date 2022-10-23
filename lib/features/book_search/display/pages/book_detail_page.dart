import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:it_book_store/core/utils/constants.dart';
import 'package:it_book_store/features/book_search/display/bloc/book_bloc/book_details_bloc.dart';
import 'package:it_book_store/features/book_search/display/bloc/book_bloc/book_state.dart';
import 'package:it_book_store/features/book_search/display/controllers/book_detail_provider.dart';
import 'package:it_book_store/features/book_search/display/widgets/custom_card.dart';
import 'package:it_book_store/features/book_search/domain/entities/book_detail_result.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/icon_shadow.dart';
import '../../domain/entities/book_pdf.dart';
import '../widgets/it_book_app_bar.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding,),
            child: Column(
              children: [
                ItBookAppBar(
                  title: 'app_title'.tr,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    splashRadius: radius,
                    icon: const IconShadow(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: verticalPadding,),
                BlocBuilder<BookDetailsBloc, BookState>(
                  bloc: Get.find<BookDetailController>().bookDetailsBloc,
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is LoadedBookDetails) {
                      BookDetailResult bookDetailResult =
                          state.bookDetailResult;
                      return Expanded(
                        child: Column(
                          children: [
                            CustomCard(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        bookDetailResult.bookDetail!.image,
                                        width: size.width * .45,
                                        height: size.height * .25,
                                        fit: BoxFit.fill,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return SizedBox(
                                            width: size.width * .45,
                                            height: size.height * .25,
                                            child: const Center(
                                              child: CircularProgressIndicator.adaptive(),
                                            ),
                                          );
                                        },
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: verticalPadding),
                                            Text(
                                              bookDetailResult.bookDetail!.title,
                                              style: Get.textTheme.headline2,
                                            ),
                                            SizedBox(height: smallVerticalPadding),
                                            Text(
                                              bookDetailResult.bookDetail?.subtitle ?? '',
                                              style: Get.textTheme.bodyText2,
                                            ),
                                            SizedBox(height: smallVerticalPadding),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(start: horizontalPadding),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'year'.tr + ': ' + (bookDetailResult.bookDetail?.year ?? ''),
                                                style: Get.textTheme.bodyText2,
                                              ),
                                              SizedBox(height: smallVerticalPadding),
                                              Text(
                                                'rating'.tr + ': ' + (bookDetailResult.bookDetail?.rating ?? ''),
                                                style: Get.textTheme.bodyText1,
                                              ),
                                              SizedBox(height: smallVerticalPadding),
                                              Text(
                                                'pages'.tr + ': ' + (bookDetailResult.bookDetail?.pages ?? ''),
                                                style: Get.textTheme.bodyText1,
                                              ),
                                              SizedBox(height: smallVerticalPadding),
                                              Text(
                                                'publisher'.tr + ': ' + (bookDetailResult.bookDetail?.publisher ?? ''),
                                                style: Get.textTheme.bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'price'.tr + ': ' + (bookDetailResult.bookDetail?.price ?? ''),
                                            style: Get.textTheme.bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: smallVerticalPadding),
                                ],
                              ),
                            ),
                            SizedBox(height: verticalPadding,),
                            Expanded(child: pdfRow(bookDetailResult.bookDetail?.pdf)),
                          ],
                        ),
                      );
                    } else if (state is Error) {
                      return Center(
                        child: Text(
                          state.message,
                          style: Get.textTheme.headline1,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pdfRow(List<BookPDF>? pdf) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: pdf?.length ?? 0,
      itemBuilder: (context, index) {
        BookPDF bookPdf = pdf![index];
        return Column(
          children: [
            Text(bookPdf.title ?? '', style: Get.textTheme.bodyText2,),
            SizedBox(height: verticalPadding,),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(bookPdf.url ?? ''));
              },
              child: Image.asset('assets/images/PDF_icon.png', height: Get.height * .15),
            ),
          ],
        );
      },
    );
  }

}
