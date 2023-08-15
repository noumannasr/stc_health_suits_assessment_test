import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:stc_health_suits_assessment_test_nouman/data/response/api_response.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/product_detail_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/product_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/respository/products_repository.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/utils.dart';

class ProductViewModel with ChangeNotifier {
  final _myProductRepo = ProductRepository();

  ApiResponse<List<ProductModel>> productList = ApiResponse.loading();

  setProductList(ApiResponse<List<ProductModel>> productListData) {
    productList = productListData;
    notifyListeners();
  }

  Future<void> getProducts(BuildContext context) async {
    setProductList(ApiResponse.loading());
    _myProductRepo.getProducts().then((value) {
      setProductList(ApiResponse.completed(List<ProductModel>.from(
          json.decode(value).map((x) => ProductModel.fromJson(x)))));
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.flushBarErrorMessage(
          error.toString(), context, AppColors.darkRedColor, 'Error');
    });
  }
}
