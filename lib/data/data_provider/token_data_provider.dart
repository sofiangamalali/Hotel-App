import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class TokenDataProvider {
  late Dio dio;

  TokenDataProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> postLogin(
      String countryCode, String phone, String password) async {
    try {
      Response response = await dio.post(loginEndPoint, data: {
        'country_code': countryCode,
        'phone': phone,
        'password': password,
      });

      return response.data;
    } catch (e) {
      return {};
    }
  }
}
