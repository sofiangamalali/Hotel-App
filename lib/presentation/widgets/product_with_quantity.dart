import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/receipt_model.dart';
import 'custom_circular_progress.dart';

class ProductWithQuantity extends StatelessWidget {
  final Service? service;
  final int? quantity;
  const ProductWithQuantity(
      {required this.quantity, required this.service, super.key});
  Widget _buildServiceQuantity(String? quantity) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      width: 60,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: Colors.grey[200],
      ),
      child: Text(
        'X$quantity',
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, height: 1),
      ),
    );
  }

  Widget _buildServiceImage(String? imageUrl) {
    return SizedBox(
        width: 100,
        height: 100,
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const CustomCircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildServiceImage(service!.image),
          Positioned(
              top: -10,
              left: -10,
              child: _buildServiceQuantity(quantity.toString()))
        ],
      ),
    );
  }
}
