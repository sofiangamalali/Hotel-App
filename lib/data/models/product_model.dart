// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final int price;
  int totalPrice;
  final String image;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        image,
        quantity,
        totalPrice,
      ];
}
