// ignore_for_file: must_be_immutable

part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesStarted extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesLoading extends ServicesState {
  @override
  List<Object> get props => [];
}

class FoodServicesLoaded extends ServicesState {
  List services;
  FoodServicesLoaded({required this.services});
  @override
  List<Object> get props => [services];
}

class OtherServicesLoaded extends ServicesState {
  List services;
  OtherServicesLoaded({required this.services});
  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {
  String errorMsg;
  ServicesError({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
