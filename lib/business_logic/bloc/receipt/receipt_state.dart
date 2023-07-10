// ignore_for_file: must_be_immutable

part of 'receipt_bloc.dart';

abstract class ReceiptState extends Equatable {
  const ReceiptState();

  @override
  List<Object> get props => [];
}

class ReceiptInitial extends ReceiptState {}

class ReceiptLoading extends ReceiptState {}

class ReceiptLoaded extends ReceiptState {
  Receipt receipt;
  ReceiptLoaded({required this.receipt});
  @override
  List<Object> get props => [receipt];
}

class ReceiptError extends ReceiptState {
  final String errorMSg;
  const ReceiptError({required this.errorMSg});
  @override
  List<Object> get props => [errorMSg];
}
