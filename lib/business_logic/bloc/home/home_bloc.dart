// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gp/data/repository/home_repo.dart';

import '../../../data/models/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final storage = const FlutterSecureStorage();
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<LoadHome>((event, emit) async {
      emit(HomeLoading());
      try {
        String? token = await storage.read(key: 'Token');
        final home = await homeRepository.getHome(token!, 'en');
        emit(HomeLoaded(home: home));
      } catch (e) {
        emit(const HomeError(errorMsg: 'Something went error'));
      }
    });
  }
}
