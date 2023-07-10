import 'package:flutter/material.dart';

class OrderListTile extends StatelessWidget {
  final String? orderId;

  final String? orderPrice;
  final Widget orderStatus;
  final VoidCallback onTap;
  const OrderListTile(
      {required this.orderId,
      required this.onTap,
      required this.orderPrice,
      required this.orderStatus,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Order id And Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Id
                Row(
                  children: [
                    const Text(
                      'Order#',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    //Date
                    Text(
                      orderId!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
            //Order price and Status
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      '\$ ',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      orderPrice!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                orderStatus,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
