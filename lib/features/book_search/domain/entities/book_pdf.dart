import 'package:equatable/equatable.dart';

class BookPDF extends Equatable {
  final String? title;
  final String? url;

  const BookPDF({this.title, this.url});

  @override
  List<Object?> get props => [
    title,
    url,
  ];
}