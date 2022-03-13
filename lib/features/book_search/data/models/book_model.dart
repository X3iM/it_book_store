import '../../domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required String title,
    required String subtitle,
    required String isbn13,
    required String price,
    required String image,
    required String url
  }) : super(
      title: title,
      subtitle: subtitle,
      isbn13: isbn13,
      price: price,
      image: image,
      url: url
  );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'price': price,
    'url': url,
    'image': image,
    'isbn13': isbn13,
    'subtitle': subtitle,
  };

}