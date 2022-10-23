import '../../domain/entities/book_pdf.dart';

class BookPDFModel extends BookPDF {
  const BookPDFModel({
    String? title,
    String? url,
  }) : super(
    title: title,
    url: url,
  );

  factory BookPDFModel.fromJson(Map<String, dynamic> json) => BookPDFModel(
    title: json['title'],
    url: json['url'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
  };

}