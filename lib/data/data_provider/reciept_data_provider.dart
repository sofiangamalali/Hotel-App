import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class ReceiptDataProvider {
  late Dio dio;
  ReceiptDataProvider() {
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getReciept(String token, String lang) async {
    try {
      Response response = await dio.get(
        recieptEndPoint,
        options: Options(
          headers: {'token': token, 'lang': lang},
        ),
      );
      return response.data;
    } catch (e) {
      return {};
    }
  }
}
