part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final String countryCode;
  final String phone;
  final String password;
  const AuthLogin(
      {required this.countryCode, required this.phone, required this.password});
  @override
  List<Object> get props => [countryCode, phone, password];
}

class AuthLogout extends AuthEvent {
  @override
  List<Object> get props => [];
}
