import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class OrderDataProvider {
  late Dio dio;
  OrderDataProvider() {
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }
  postOrder(String token, String lang, String jsonBody) async {
    try {
      Response response = await dio.post(orderEndPoint,
          options: Options(
            headers: {'token': token, 'lang': lang},
          ),
          data: jsonBody);
      return response;
    } catch (e) {
      return {};
    }
  }
}
