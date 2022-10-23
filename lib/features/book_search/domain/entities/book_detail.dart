import 'package:it_book_store/features/book_search/domain/entities/book.dart';

import 'book_pdf.dart';

class BookDetail extends Book {
  final String authors;
  final String publisher;
  final String isbn10;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final List<BookPDF>? pdf;

  const BookDetail({
    required String title,
    required String subtitle,
    required String isbn13,
    required String price,
    required String image,
    required String url,
    required this.authors,
    required this.desc,
    required this.isbn10,
    required this.pages,
    this.pdf,
    required this.publisher,
    required this.rating,
    required this.year,
  }) : super(
      title: title,
      subtitle: subtitle,
      isbn13: isbn13,
      price: price,
      image: image,
      url: url);


  @override
  List<Object?> get props => [
    ...super.props,
    authors,
    desc,
    isbn10,
    pages,
    pdf,
    publisher,
    rating,
    year
  ];

}