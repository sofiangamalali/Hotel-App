import '../data_provider/token_data_provider.dart';
import '../models/token_model.dart';

class TokenRepository {
  final TokenDataProvider tokenDataProvider;
  TokenRepository({required this.tokenDataProvider});
  Future<Token> postLogin(
      String countryCode, String phone, String password) async {
    final token =
        await tokenDataProvider.postLogin(countryCode, phone, password);
    return Token.fromJson(token);
  }
}
