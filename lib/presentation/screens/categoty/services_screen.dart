import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/bloc/services/services_bloc.dart';
import '../../widgets/custom_circular_progress.dart';

import '../../../data/models/product_model.dart';

import '../../widgets/product_card.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text(
            'SERVICES',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
        ),
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is OtherServicesLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: state.services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return ProductCard(
                    product: Product(
                        id: state.services[index].id.toString(),
                        name: state.services[index].name,
                        price: state.services[index].price,
                        image: state.services[index].image,
                        quantity: 1,
                        totalPrice: state.services[index].price));
              },
            );
          } else if (state is ServicesLoading) {
            return const CustomCircularProgressIndicator();
          } else {
            return const Center(
              child: Text(
                'Something Went Error!',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
