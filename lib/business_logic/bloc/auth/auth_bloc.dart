// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gp/data/repository/token_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final storage = const FlutterSecureStorage();
  final TokenRepository tokenRepository;
  AuthBloc(this.tokenRepository) : super(AuthStarted()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await tokenRepository.postLogin(
            event.countryCode, event.phone, event.password);
        if (token.status == true) {
          await storage.write(key: 'Token', value: token.data?.token);
          emit(AuthLogined());
        } else {
          emit(const AuthError(
              errorMsg: 'Phone Number Or Passowrd is not valid!'));
        }
      } catch (_) {
        emit(const AuthError(errorMsg: 'Something went error!'));
      }
    });
    on<AuthLogout>((event, emit) async {
      await storage.delete(key: 'Token');
      emit(AuthLogouted());
    });
  }
}
