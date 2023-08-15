import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:stc_health_suits_assessment_test_nouman/data/response/status.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/app_text.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/round_button.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/product_detail_view_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailViewModel productDetailViewModel =
      ProductDetailViewModel();

  @override
  void initState() {
    // TODO: implement initState
    productDetailViewModel.setExpandSheet(false);
    productDetailViewModel.getProductDetail(context, widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ProductDetailViewModel>(
      create: (BuildContext context) => productDetailViewModel,
      child: Consumer<ProductDetailViewModel>(
        builder: (context, value, _) {
          switch (value.productDetail.status) {
            case Status.LOADING:
              return Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: AppBar(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Container(
                    padding: const EdgeInsets.only(
                        left: 0, top: 4, bottom: 4, right: 0),
                    width: size.width,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            print('We are here');
                            Navigator.of(context).pop(true);
                          },
                          child: AbsorbPointer(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset:
                                    Offset(0, 2), // Offset of the shadow
                                    blurRadius: 2, // Spread of the shadow
                                    spreadRadius:
                                    0, // Amount of spreading, negative values can be used to shrink the shadow
                                  ),
                                ],
                              ),
                              width: 35,
                              height: 35,
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.blackColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2), // Offset of the shadow
                                blurRadius: 2, // Spread of the shadow
                                spreadRadius:
                                0, // Amount of spreading, negative values can be used to shrink the shadow
                              ),
                            ],
                          ),
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.more_vert,
                            color: AppColors.blackColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.lightBlueColor,
                  strokeWidth: 2,
                )),
              );
            case Status.ERROR:
              return Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  appBar: AppBar(
                    backgroundColor: AppColors.whiteColor,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    title: Container(
                      padding: const EdgeInsets.only(
                          left: 0, top: 4, bottom: 4, right: 0),
                      width: size.width,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              print('We are here');
                              Navigator.of(context).pop(true);
                            },
                            child: AbsorbPointer(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset:
                                      Offset(0, 2), // Offset of the shadow
                                      blurRadius: 2, // Spread of the shadow
                                      spreadRadius:
                                      0, // Amount of spreading, negative values can be used to shrink the shadow
                                    ),
                                  ],
                                ),
                                width: 35,
                                height: 35,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.blackColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 2), // Offset of the shadow
                                  blurRadius: 2, // Spread of the shadow
                                  spreadRadius:
                                  0, // Amount of spreading, negative values can be used to shrink the shadow
                                ),
                              ],
                            ),
                            width: 35,
                            height: 35,
                            child: Icon(
                              Icons.more_vert,
                              color: AppColors.blackColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: Center(
                      child: Text(value.productDetail.message.toString())));
            case Status.COMPLETED:
              return Scaffold(
                backgroundColor: AppColors.whiteColor,
                bottomSheet: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 8, bottom: 8),
                        child: Text(
                          value.productDetail.data!.price.toString() +
                              ' ' +
                              ' AED',
                          style: TextStyle(
                              color: AppColors.darkBlueColor,
                              fontSize: TextStylesData.titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors
                          .transparent, //could change this to Color(0xFF737373),
                      //so you don't have to change MaterialApp canvasColor
                      child: Container(
                          decoration: new BoxDecoration(
                              color: AppColors.lightGreyColor,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(30.0),
                                  topRight: const Radius.circular(30.0))),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    productDetailViewModel.expandSheet
                                        ? productDetailViewModel
                                            .setExpandSheet(false)
                                        : productDetailViewModel
                                            .setExpandSheet(true);
                                  },
                                  icon: Icon(
                                    productDetailViewModel.expandSheet
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                    color: AppColors.lightBlueColor,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0,
                                                      2), // Offset of the shadow
                                                  blurRadius:
                                                      2, // Spread of the shadow
                                                  spreadRadius:
                                                      0, // Amount of spreading, negative values can be used to shrink the shadow
                                                ),
                                              ],
                                            ),
                                            width: 50,
                                            height: 50,
                                            child: Icon(
                                              Icons.ios_share_outlined,
                                              color: AppColors.lightBlueColor,
                                              size: 20,
                                            ),
                                          ),
                                          RoundButton(
                                            round: 30.0,
                                            width: size.width * 0.68,
                                            color: AppColors.lightBlueColor,
                                            title: AppText.orderNowText,
                                            onPress: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                              color: AppColors.greyColor,
                                              fontSize: TextStylesData
                                                  .extraSmallFontSize),
                                        )),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          value.productDetail.data!.description
                                              .toString(),
                                          style: TextStyle(
                                              color: AppColors.greyColor,
                                              fontSize: TextStylesData
                                                  .extraSmallFontSize),
                                          maxLines:
                                              //expandSheet.value ? 100 :
                                              8,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Visibility(
                                      visible:
                                          productDetailViewModel.expandSheet,
                                      child: Container(
                                        //  height: size.height*0.1,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "Review (${value.productDetail.data!.rating!.count.toString()})",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.greyColor,
                                                        fontSize: TextStylesData
                                                            .extraSmallFontSize),
                                                  ),
                                                )),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          value
                                                              .productDetail
                                                              .data!
                                                              .rating!
                                                              .rate
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .blackColor,
                                                              fontSize:
                                                                  TextStylesData
                                                                      .titleFontSize),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      child: RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: value
                                                            .productDetail
                                                            .data!
                                                            .rating!
                                                            .rate!,
                                                        minRating: 0,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        unratedColor: AppColors
                                                            .greyColor
                                                            .withOpacity(0.4),
                                                        //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                appBar: AppBar(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Container(
                    padding: const EdgeInsets.only(
                        left: 0, top: 4, bottom: 4, right: 0),
                    width: size.width,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            print('We are here');
                            Navigator.of(context).pop(true);
                          },
                          child: AbsorbPointer(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset:
                                        Offset(0, 2), // Offset of the shadow
                                    blurRadius: 2, // Spread of the shadow
                                    spreadRadius:
                                        0, // Amount of spreading, negative values can be used to shrink the shadow
                                  ),
                                ],
                              ),
                              width: 35,
                              height: 35,
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.blackColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2), // Offset of the shadow
                                blurRadius: 2, // Spread of the shadow
                                spreadRadius:
                                    0, // Amount of spreading, negative values can be used to shrink the shadow
                              ),
                            ],
                          ),
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.more_vert,
                            color: AppColors.blackColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Container(
                      height: size.height * 0.55,
                      width: size.width,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor,
                            ),
                            //color: AppColors.greyColor.withOpacity(0.3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: CachedNetworkImage(
                                  height: size.height,
                                  width: size.width,
                                  fit: BoxFit.scaleDown,
                                  imageUrl: value.productDetail.data!.image
                                      .toString(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                width: size.width,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 0, bottom: 0),
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                        color: AppColors.darkBlueColor,
                                        fontSize: TextStylesData.titleFontSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}
