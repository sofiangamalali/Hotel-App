import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/cart/cart_bloc.dart';
import '../widgets/cart/cart_item_view.dart';
import '../widgets/cart/empty_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(child: Text('Cart')),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state is OrderConfirmed) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text(
                      'Your Order Is Confirmed!',
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Ok',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          listenWhen: (previous, current) {
            return current != previous;
          },
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }
            if (state is CartLoaded) {
              if (state.cart.items.isEmpty) {
                return const EmptyCart();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.cart.items.length,
                          itemBuilder: (context, index) {
                            return CartItemView(
                              product: state.cart.items[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900],
                            ),
                          ),
                          Text(
                            ' \$${state.cart.total.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CartBloc>().add(CartMakeOrder());
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 50),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            backgroundColor: Colors.teal,
                            textStyle: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Order',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            } else if (state is CartError) {
              return Center(
                child: Text(state.errorMsg),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
