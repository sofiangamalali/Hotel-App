import 'package:equatable/equatable.dart';
import 'product_model.dart';

class Cart extends Equatable {
  final List<Product> items;
  const Cart({this.items = const <Product>[]});
  double get total =>
      items.fold(0, (total, current) => total + current.totalPrice);
  @override
  List<Object?> get props => [items];
}
