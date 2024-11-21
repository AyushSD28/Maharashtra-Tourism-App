import 'dart:io';

class Reviewmodel {
  String name;
  String date;
  String review;
  File? image;
  double? rating;

  Reviewmodel({
    required this.name,
    required this.date,
    required this.review,
    this.image,
    this.rating,
  });
}
