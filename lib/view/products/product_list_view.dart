import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stc_health_suits_assessment_test_nouman/data/response/status.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/components/app_text.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes_name.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/products/widget/product_item.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/product_view_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/user_view_model.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ProductViewModel productViewModel = ProductViewModel();
  @override
  void initState() {
    // TODO: implement initState
    productViewModel.getProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userviewModel = Provider.of<UserViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        //elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TextStylesData.appBarRound),
        ),
        title: Text(
          AppText.all_products,
          style: TextStyle(
              color: AppColors.darkBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: TextStylesData.titleFontSize),
        ),
        actions: [
          IconButton(
              onPressed: () {
                userviewModel.remove().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.login, (route) => false);
                });
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.lightBlueColor,
              ))
        ],
      ),
      body: ChangeNotifierProvider<ProductViewModel>(
        create: (BuildContext context) => productViewModel,
        child: Consumer<ProductViewModel>(builder: (context, value, _) {
          switch (value.productList.status) {
            case Status.LOADING:
              return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.lightBlueColor,
                    strokeWidth: 2,
                  ));
            case Status.ERROR:
              return Center(child: Text(value.productList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: productViewModel.productList.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    final productItem =
                    productViewModel.productList.data![index];
                    return ProductItem(
                      product: productItem,
                    );
                  });
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
