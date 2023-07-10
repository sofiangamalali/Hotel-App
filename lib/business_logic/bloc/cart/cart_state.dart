// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class OrderConfirmed extends CartState {
  @override
  List<Object> get props => [];
}

class CartError extends CartState {
  String errorMsg;
  final Cart cart;

  CartError({required this.errorMsg, required this.cart});
  @override
  List<Object> get props => [errorMsg, cart];
}

class CartLoaded extends CartState {
  final Cart cart;

  const CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}
