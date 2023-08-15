import 'package:stc_health_suits_assessment_test_nouman/data/network/BaseApiService.dart';
import 'package:stc_health_suits_assessment_test_nouman/data/network/NetworkApiService.dart';

class ProductDetailRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> getProductDetail(String url) async {
    try {
      dynamic response = await _apiService.getGetApiResponse(url);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
