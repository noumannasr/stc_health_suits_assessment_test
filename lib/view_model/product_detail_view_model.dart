import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:stc_health_suits_assessment_test_nouman/data/response/api_response.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/product_detail_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/product_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/app_urls.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/respository/product_detail_repository.dart';
import 'package:stc_health_suits_assessment_test_nouman/respository/products_repository.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/utils.dart';

class ProductDetailViewModel with ChangeNotifier {
  final _myProductRepoData = ProductDetailRepository();
  bool _expandSheet = false;
  bool get expandSheet => _expandSheet;

  setExpandSheet(bool value) {
    _expandSheet = value;
    notifyListeners();
  }

  ApiResponse<ProductDetailModel> productDetail = ApiResponse.loading();

  setProductDetail(ApiResponse<ProductDetailModel> productDetailData) {
    productDetail = productDetailData;
    notifyListeners();
  }

  Future<void> getProductDetail(BuildContext context, int id) async {
    setProductDetail(ApiResponse.loading());

    _myProductRepoData
        .getProductDetail(AppUrls.productsEndPoint + '/$id')
        .then((value) {
      //print(' We are in 200 ${value.toString()}');
      setProductDetail(ApiResponse.completed(
          ProductDetailModel.fromJson(json.decode(value))));
    }).onError((error, stackTrace) {
      //print(error.toString() + ' We are in products api');
      setProductDetail(ApiResponse.error(error.toString()));
      Utils.flushBarErrorMessage(
          error.toString(), context, AppColors.darkRedColor, 'Error');
    });
  }
}
