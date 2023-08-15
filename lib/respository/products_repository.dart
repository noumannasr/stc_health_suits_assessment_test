import 'package:stc_health_suits_assessment_test_nouman/data/network/BaseApiService.dart';
import 'package:stc_health_suits_assessment_test_nouman/data/network/NetworkApiService.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/app_urls.dart';

class ProductRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> getProducts() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrls.productsEndPoint);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
