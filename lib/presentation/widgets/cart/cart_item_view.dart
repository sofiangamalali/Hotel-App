import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/bloc/cart/cart_bloc.dart';
import '../../../data/models/product_model.dart';

class CartItemView extends StatelessWidget {
  final Product product;

  const CartItemView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: const EdgeInsets.only(bottom: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 0), color: Colors.white, blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: product.image,
                  width: 100,
                  height: 80,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\$${product.totalPrice}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Add and Remove Item
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Expanded(
                flex: 1,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartItemRemoved(product));
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Text(
                      product.quantity.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartItemAdded(product));
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
