import '../data_provider/home_data_provider.dart';

import '../models/home_model.dart';

class HomeRepository {
  final HomeDataProvider homeDataProvider;
  HomeRepository({required this.homeDataProvider});
  Future<Home> getHome(String token, String lang) async {
    final home = await homeDataProvider.getHome(token, lang);
    return Home.fromJson(home);
  }
}
