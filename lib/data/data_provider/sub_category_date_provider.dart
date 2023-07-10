import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CategoryDataProvider {
  late Dio dio;
  CategoryDataProvider() {
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getCategory(
      String type, String token, String lang) async {
    try {
      Response response = await dio.get(
        categoryEndPoint + type,
        options: Options(
          headers: {'token': token, 'lang': lang},
        ),
      );
      return response.data;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, dynamic>> getSubCategory(
      int? categoryId, String token, String lang) async {
    try {
      Response response = await dio.get(
        subCategoryEndPoint + categoryId.toString(),
        options: Options(
          headers: {'token': token, 'lang': lang},
        ),
      );
      return response.data;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, dynamic>> getService(
      int? subCategoryId, String token, String lang) async {
    try {
      Response response = await dio.get(
        serviceEndPoint + subCategoryId.toString(),
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
