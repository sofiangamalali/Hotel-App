import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class HomeDataProvider {
  late Dio dio;
  HomeDataProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getHome(String token, String lang) async {
    try {
      Response response = await dio.get(
        homeEndPoint,
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
