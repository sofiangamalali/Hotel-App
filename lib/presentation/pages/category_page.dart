// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/business_logic/bloc/services/services_bloc.dart';
import 'package:gp/presentation/screens/categoty/food_and_drinks_screen.dart';
import 'package:gp/presentation/screens/categoty/services_screen.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(child: Text('Category')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCategorySection(
              context: context,
              title: 'Food & Drinks',
              color: Colors.teal[500]!,
              icon: Icons.fastfood,
              ontap: () {
                context.read<ServicesBloc>().add(GetFoodServices());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodAndDrinksScreen()),
                );
              }),
          _buildCategorySection(
              context: context,
              title: 'Services',
              color: Colors.teal[500]!,
              icon: Icons.room_service,
              ontap: () {
                context.read<ServicesBloc>().add(GetOtherServices());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceScreen()),
                );
              }),
        ],
      ),
    );
  }

  Widget _buildCategorySection({
    BuildContext? context,
    String? title,
    Color? color,
    IconData? icon,
    VoidCallback? ontap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 80.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
