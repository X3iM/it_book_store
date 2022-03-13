import '../../domain/entities/book_detail.dart';

class BookDetailModel extends BookDetail {
  BookDetailModel({
    required String title,
    required String subtitle,
    required String isbn13,
    required String price,
    required String image,
    required String url,
    required String authors,
    required String desc,
    required String isbn10,
    required String pages,
    List<String>? pdf,
    required String publisher,
    required String rating,
    required String year
  }) : super(
      title: title,
      subtitle: subtitle,
      isbn13: isbn13,
      price: price,
      image: image,
      url: url,
      authors: authors,
      desc: desc,
      isbn10: isbn10,
      pages: pages,
      pdf: pdf,
      publisher: publisher,
      rating: rating,
      year: year
  );

  factory BookDetailModel.fromJson(Map<String, dynamic> json) => BookDetailModel(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
      authors: json['authors'],
      desc: json['desc'],
      isbn10: json['isbn10'],
      pages: json['pages'],
      pdf: json['pdf'] != null ? json['pdf'].toList() : null,
      publisher: json['publisher'],
      rating: json['rating'],
      year: json['year']
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isbn13': isbn13,
    'price': price,
    'image': image,
    'url': url,
    'authors': authors,
    'desc': desc,
    'isbn10': isbn10,
    'pages': pages,
    'pdf': pdf,
    'publisher': publisher,
    'rating': rating,
    'year': year,
  };

}