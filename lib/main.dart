import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'business_logic/bloc/auth/auth_bloc.dart';
import 'business_logic/bloc/cart/cart_bloc.dart';
import 'business_logic/bloc/receipt/receipt_bloc.dart';
import 'business_logic/bloc/services/services_bloc.dart';
import 'data/data_provider/reciept_data_provider.dart';
import 'data/data_provider/sub_category_date_provider.dart';
import 'data/repository/reciept_repo.dart';
import 'data/repository/sub_category_repo.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'business_logic/bloc/home/home_bloc.dart';
import 'data/data_provider/home_data_provider.dart';
import 'data/data_provider/token_data_provider.dart';
import 'data/repository/home_repo.dart';
import 'data/repository/token_repo.dart';
import 'presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => ReceiptBloc(
              ReceiptRepository(receiptDataProvider: ReceiptDataProvider()))
            ..add(LoadReceipt()),
        ),
        BlocProvider(
          create: (_) =>
              AuthBloc(TokenRepository(tokenDataProvider: TokenDataProvider())),
        ),
        BlocProvider(
          create: (_) =>
              HomeBloc(HomeRepository(homeDataProvider: HomeDataProvider()))
                ..add(LoadHome()),
        ),
        BlocProvider(
            create: (_) => ServicesBloc(CategoryRepository(
                categoryDataProvider: CategoryDataProvider()))),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Ubuntu',
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.teal[50])),
        debugShowCheckedModeBanner: false,
        routes: {
          'HomeScreen': (context) => const HomeScreen(),
          'LoginScreen': (context) => LoginScreen(),
        },
        home: FutureBuilder<String?>(
          future: storage.read(key: 'Token'),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData && snapshot.data != null) {
              return const HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
