import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final String? orderStatus;
  const OrderStatus({required this.orderStatus, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: orderStatus == 'new'
            ? Colors.green
            : orderStatus == 'process'
                ? Colors.orange
                : orderStatus == 'end'
                    ? Colors.grey
                    : Colors.red,
      ),
      child: Center(
        child: Text(
          orderStatus!.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
