import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_circular_progress.dart';
import '../../business_logic/bloc/cart/cart_bloc.dart';

import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: screenWidth / 2 - 50,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 0))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            height: 150,
            width: 150,
            fit: BoxFit.fill,
            imageUrl: product.image,
            placeholder: (context, url) =>
                const CustomCircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            width: screenWidth / 2 - 50 + 30,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text(
                      'Price:',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const Text(
                      '\$',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      product.price.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      return InkWell(
                        onTap: () {
                          context.read<CartBloc>().add(CartItemAdded(product));
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.teal,
                                content: (Text(
                                  '${product.name.toUpperCase()} added to cart.',
                                  style: const TextStyle(fontSize: 18),
                                )),
                              ),
                            );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Text('Error');
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
