part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  final Product product;
  const CartItemAdded(this.product);
  @override
  List<Object> get props => [product];
}

class CartItemRemoved extends CartEvent {
  final Product product;
  const CartItemRemoved(this.product);
  @override
  List<Object> get props => [product];
}

class CartMakeOrder extends CartEvent {
  @override
  List<Object> get props => [];
}
