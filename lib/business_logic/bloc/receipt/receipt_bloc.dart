import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/models/receipt_model.dart';
import '../../../data/repository/reciept_repo.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  final storage = const FlutterSecureStorage();
  final ReceiptRepository receiptRepository;
  ReceiptBloc(this.receiptRepository) : super(ReceiptInitial()) {
    on<LoadReceipt>((event, emit) async {
      emit(ReceiptLoading());
      try {
        String? token = await storage.read(key: 'Token');
        final receipt = await receiptRepository.getReceipt(token!, 'en');
        emit(ReceiptLoaded(receipt: receipt));
      } catch (e) {
        emit(ReceiptError(errorMSg: e.toString()));
      }
    });
  }
}
