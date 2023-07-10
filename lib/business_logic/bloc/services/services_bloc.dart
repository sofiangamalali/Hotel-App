// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gp/data/repository/sub_category_repo.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final storage = const FlutterSecureStorage();
  final CategoryRepository categoryRepository;
  ServicesBloc(this.categoryRepository) : super(ServicesStarted()) {
    on<GetFoodServices>((event, emit) async {
      emit(ServicesLoading());
      try {
        String? token = await storage.read(key: 'Token');
        List allServices =
            await categoryRepository.getAllServirce('food', token!, 'en');
        emit(FoodServicesLoaded(services: allServices));
      } catch (e) {
        emit(ServicesError(errorMsg: e.toString()));
      }
    });
    on<GetOtherServices>((event, emit) async {
      emit(ServicesLoading());
      try {
        String? token = await storage.read(key: 'Token');
        List allServices =
            await categoryRepository.getAllServirce('other', token!, 'en');
        emit(OtherServicesLoaded(services: allServices));
      } catch (e) {
        emit(ServicesError(errorMsg: e.toString()));
      }
    });
  }
}
