part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final Home home;
  const HomeLoaded({required this.home});
  @override
  List<Object> get props => [home];
}

class HomeError extends HomeState {
  final String errorMsg;
  const HomeError({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
