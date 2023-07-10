// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gp/data/data_provider/order_data_provider.dart';
import 'package:gp/data/models/order_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/cart_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final storage = const FlutterSecureStorage();
  CartBloc() : super(CartLoading()) {
    on<CartStarted>((event, emit) async {
      await Future<void>.delayed(
        const Duration(
          microseconds: 300,
        ),
      );

      emit(const CartLoaded());
    });
    on<CartItemAdded>((event, emit) {
      if (state is CartLoaded) {
        final state = this.state as CartLoaded;
        if (state.cart.items.contains(event.product)) {
          int index = state.cart.items.indexOf(event.product);
          state.cart.items[index].quantity += 1;
          state.cart.items[index].totalPrice += event.product.price;
          emit(CartLoading());
          emit(
            CartLoaded(
              cart: Cart(items: List.from(state.cart.items)),
            ),
          );
        } else {
          emit(
            CartLoaded(
              cart: Cart(
                items: List.from(state.cart.items)..add(event.product),
              ),
            ),
          );
        }
      }
    });
    on<CartItemRemoved>((event, emit) {
      if (state is CartLoaded) {
        final state = this.state as CartLoaded;

        if (state.cart.items.contains(event.product) &&
            event.product.quantity != 1) {
          int index = state.cart.items.indexOf(event.product);
          state.cart.items[index].quantity -= 1;
          state.cart.items[index].totalPrice -= event.product.price;

          emit(CartLoading());
          emit(
            CartLoaded(
              cart: Cart(items: List.from(state.cart.items)),
            ),
          );
        } else {
          emit(
            CartLoaded(
              cart: Cart(
                items: List.from(state.cart.items)..remove(event.product),
              ),
            ),
          );
        }
      }
    });
    on<CartMakeOrder>((event, emit) async {
      if (state is CartLoaded) {
        final state = this.state as CartLoaded;
        try {
          String? token = await storage.read(key: 'Token');
          Order order = Order.fromProductList(List.from(state.cart.items));
          String jsonBody = jsonEncode(order.toJson());

          final response =
              await OrderDataProvider().postOrder(token!, 'en', jsonBody);
          if (response.statusCode == 200) {
            emit(OrderConfirmed());
            Future.delayed(const Duration(seconds: 1));
            emit(const CartLoaded(cart: Cart(items: [])));
          } else {
            emit(CartError(
                errorMsg: 'Erorr', cart: Cart(items: state.cart.items)));
            Future.delayed(const Duration(seconds: 1));
            emit(CartLoaded(cart: Cart(items: List.from(state.cart.items))));
          }
        } catch (e) {
          emit(CartError(
              errorMsg: 'Something Went Erorr!',
              cart: Cart(items: state.cart.items)));
          Future.delayed(const Duration(seconds: 1));
          emit(CartLoaded(cart: Cart(items: List.from(state.cart.items))));
        }
      }
    });
  }
}
