// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../business_logic/bloc/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  late String countryCode;
  late String phoneNumber;
  late String password;
  final storage = const FlutterSecureStorage();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  Widget _buildSignInButton() {
    return Material(
      elevation: 5,
      color: Colors.teal,
      borderRadius: BorderRadius.circular(10),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(_buildSnakBar(state.errorMsg));
          } else if (state is AuthLogined) {
            Navigator.of(context).pushReplacementNamed('HomeScreen');
          }
        },
        builder: (context, state) {
          return MaterialButton(
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                context.read<AuthBloc>().add(AuthLogin(
                    countryCode: countryCode,
                    phone: phoneNumber,
                    password: password));
              } else {}
            },
            minWidth: 200,
            height: 25,
            child: state is AuthLoading
                ? _buildCircularProgressIndicator()
                : const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
          );
        },
      ),
    );
  }

  SnackBar _buildSnakBar(String content) {
    return SnackBar(
      backgroundColor: Colors.teal[300],
      content: Text(
        content,
        style: const TextStyle(fontSize: 15),
      ),
      duration: const Duration(seconds: 2),
    );
  }

  Widget _buildCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _buildLogo(screenHeight) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * .020),
      child: Image.asset(
        'assets/images/Logo.png',
        height: 300,
        width: 300,
      ),
    );
  }

  Widget _buildCountryCodeAndPhoneRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Country Code
        Expanded(
          flex: 1,
          child: TextFormField(
            cursorHeight: 30,
            textAlign: TextAlign.center,
            style: const TextStyle(letterSpacing: 2, fontSize: 20),
            decoration: InputDecoration(
              hintText: 'Country Code',
              hintStyle:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red[500]!, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red[500]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.teal[300]!, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
              ),
            ),
            cursorColor: Colors.teal[300],
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              countryCode = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              } else {
                bool isValid = RegExp(r'^\+[1-9]\d{0,2}$').hasMatch(value);
                return isValid ? null : 'Not valid';
              }
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        //PhoneNumber
        Expanded(
          flex: 2,
          child: TextFormField(
            textAlign: TextAlign.center,
            cursorHeight: 30,
            style: const TextStyle(letterSpacing: 2, fontSize: 20),
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red[500]!, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red[500]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.teal[300]!, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
              ),
            ),
            cursorColor: Colors.teal[300],
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              phoneNumber = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              } else {
                bool isValid = RegExp(r'^[0-9]\d{6,14}$').hasMatch(value);
                return isValid ? null : 'Not Valid';
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Expanded(
        child: TextFormField(
      textAlign: TextAlign.center,
      cursorHeight: 30,
      style: const TextStyle(letterSpacing: 2, fontSize: 20),
      decoration: InputDecoration(
        hintText: 'Passowrd',
        hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.red[500]!, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.red[500]!, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.teal[300]!, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
        ),
      ),
      obscureText: true,
      cursorColor: Colors.teal[300],
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        } else {
          return null;
        }
      },
    ));
  }

  Widget _buildLoginText() {
    return Row(
      children: const [
        SizedBox(
          width: 10,
        ),
        Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusNode().unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight - 24,
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        _buildLogo(screenHeight),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                _buildLoginText(),
                                const SizedBox(
                                  height: 25,
                                ),
                                _buildCountryCodeAndPhoneRow(),
                                const SizedBox(
                                  height: 20,
                                ),
                                _buildPasswordField(),
                                _buildSignInButton(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
