import '../data_provider/reciept_data_provider.dart';
import '../models/receipt_model.dart';

class ReceiptRepository {
  final ReceiptDataProvider receiptDataProvider;
  ReceiptRepository({required this.receiptDataProvider});
  Future<Receipt> getReceipt(String token, String lang) async {
    final receipt = await receiptDataProvider.getReciept(token, lang);
    return Receipt.fromJson(receipt);
  }
}
