import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../screens/order_screen.dart';
import '../widgets/custom_circular_progress.dart';
import '../widgets/order_listtile.dart';
import '../widgets/order_status.dart';
import '../../business_logic/bloc/receipt/receipt_bloc.dart';
import '../widgets/error_message.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});
  final storage = const FlutterSecureStorage();
  Widget _buildCustomerNameText(String? customerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Customer Name:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          customerName!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRoomChargeText(String? roomCharge) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Room Charge:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              const TextSpan(text: '\$', style: TextStyle(color: Colors.green)),
              TextSpan(text: roomCharge)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersText() {
    return const Text(
      'Orders:',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTotalCharge(String? total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total:',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            children: [
              const TextSpan(text: '\$', style: TextStyle(color: Colors.green)),
              TextSpan(text: total)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Receipt')),
        backgroundColor: Colors.teal,
      ),
      body: RefreshIndicator(
        color: Colors.teal,
        onRefresh: () async {
          context.read<ReceiptBloc>().add(LoadReceipt());
        },
        child: BlocBuilder<ReceiptBloc, ReceiptState>(
          builder: (context, state) {
            if (state is ReceiptLoaded) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCustomerNameText(state.receipt.data!.guestName),
                    const SizedBox(height: 15),
                    _buildRoomChargeText(
                        state.receipt.data?.roomCharge.toString()),
                    const SizedBox(height: 15),
                    _buildOrdersText(),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: state.receipt.data?.orders!.length,
                        itemBuilder: (context, index) {
                          return OrderListTile(
                            orderId: state.receipt.data?.orders![index].id
                                .toString(),
                            orderPrice: state.receipt.data?.orders![index].price
                                .toString(),
                            orderStatus: OrderStatus(
                                orderStatus:
                                    state.receipt.data?.orders![index].status),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                    order: state.receipt.data!.orders![index]),
                              ));
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTotalCharge(
                        state.receipt.data?.totalCharge.toString()),
                  ],
                ),
              );
            } else if (state is ReceiptLoading) {
              return const CustomCircularProgressIndicator();
            } else {
              return const ErrorMsg();
            }
          },
        ),
      ),
    );
  }
}
