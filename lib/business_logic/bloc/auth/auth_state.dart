part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogined extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogouted extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String errorMsg;
  const AuthError({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
