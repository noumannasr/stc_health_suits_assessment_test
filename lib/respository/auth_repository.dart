import 'package:stc_health_suits_assessment_test_nouman/data/network/BaseApiService.dart';
import 'package:stc_health_suits_assessment_test_nouman/data/network/NetworkApiService.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/app_urls.dart';

class AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrls.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
