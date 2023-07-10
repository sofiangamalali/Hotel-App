// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gp/business_logic/bloc/auth/auth_bloc.dart';
import '../../business_logic/bloc/home/home_bloc.dart';
import '../widgets/custom_circular_progress.dart';
import '../widgets/error_message.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final storage = const FlutterSecureStorage();
  Widget _buildRoomImage(imgUrl) {
    return SizedBox(
      width: double.infinity,
      height: 275,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) => const CustomCircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showLogoutConfirmationDialog(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
        child: const Icon(
          Icons.power_settings_new_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLogouted) {
              Navigator.of(context).pushReplacementNamed('LoginScreen');
            }
          },
          builder: (context, state) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogout());
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildWelcomeTexts(String? customerName) {
    return Row(
      children: [
        Text(
          customerName!,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Welcome!',
          style: TextStyle(
              color: Colors.teal[500],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildUserData(String info, String? data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            info,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(data!, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Container(
            color: Colors.white,
            child: Column(children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildRoomImage(state.home.data?.room!.image),
                  Positioned(
                      top: 34, right: 10, child: _buildLogoutButton(context)),
                  Positioned(
                    top: 240,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      width: screenWidth,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: _buildWelcomeTexts(state.home.data?.guest!.name),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildUserData(
                        'Hotel:', state.home.data?.guest?.hotel!.name),
                    _buildUserData(
                        'Floor:', state.home.data?.room?.floor!.floorNum),
                    _buildUserData('Room:', state.home.data?.room!.code),
                    _buildUserData('Room Type:',
                        state.home.data?.room!.roomType!.roomType),
                    _buildUserData(
                        'CheckIn Date:', state.home.data?.guest!.checkin),
                    _buildUserData(
                        'CheckOut Date:', state.home.data?.guest!.checkout),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          );
        } else if (state is HomeLoading) {
          return const CustomCircularProgressIndicator();
        } else {
          return const ErrorMsg();
        }
      },
    );
  }
}
