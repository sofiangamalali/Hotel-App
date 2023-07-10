import 'package:flutter/material.dart';
import '../widgets/order_status.dart';
import '../widgets/product_with_quantity.dart';
import '../../data/models/receipt_model.dart';

class OrderScreen extends StatelessWidget {
  final Order? order;
  const OrderScreen({required this.order, super.key});
  Widget _buildOrderInfo(String? info, String? data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          data!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildOrderStatus(String? orderStatus) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'OrderStatus:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        OrderStatus(orderStatus: orderStatus!)
      ],
    );
  }

  Widget _buildProductsGridView(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
        ),
        itemCount: order!.carts!.length,
        itemBuilder: (context, index) {
          return ProductWithQuantity(
            service: order?.carts![index].service,
            quantity: order?.carts![index].quantity,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildOrderInfo('OrderID:', order!.id.toString()),
            const SizedBox(
              height: 15,
            ),
            _buildOrderStatus(order!.status),
            const SizedBox(
              height: 15,
            ),
            _buildOrderInfo('Employee:', order!.employeeName),
            const SizedBox(
              height: 15,
            ),
            _buildOrderInfo('Supervisor:', order!.supervisorName),
            const SizedBox(
              height: 15,
            ),
            _buildOrderInfo('Total Charge:', order!.price.toString()),
            const SizedBox(
              height: 15,
            ),
            _buildOrderInfo('Prdoducts:', ''),
            const SizedBox(
              height: 15,
            ),
            Expanded(child: _buildProductsGridView(context)),
          ],
        ),
      ),
    );
  }
}
