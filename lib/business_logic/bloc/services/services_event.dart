part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class GetFoodServices extends ServicesEvent {
  @override
  List<Object> get props => [];
}

class GetOtherServices extends ServicesEvent {
  @override
  List<Object> get props => [];
}
