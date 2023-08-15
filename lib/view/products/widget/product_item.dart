import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/product_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/app_text.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes_name.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/detail/product_detail_screen.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/product_view_model.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.product_detail,
            arguments: widget.product.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteColor,
                      ),
                      //color: AppColors.greyColor.withOpacity(0.3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CachedNetworkImage(
                            height: size.height * 0.25,
                            width: size.width,
                            fit: BoxFit.scaleDown,
                            imageUrl: widget.product.image.toString(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.02,
                    left: size.width * 0.05,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 4, top: 4, bottom: 4, right: 8),
                      width: size.width * 0.88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.price.toString() + ' ' + ' AED',
                            style: TextStyle(
                                color: AppColors.darkBlueColor,
                                fontSize: TextStylesData.mediumFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: RatingBar.builder(
                              itemSize: 20,
                              initialRating: widget.product.rating!.rate!,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              unratedColor: AppColors.greyColor,
                              //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              width: size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.product.title.toString(),
                style: TextStyle(
                    color: AppColors.darkBlueColor,
                    fontSize: TextStylesData.smallFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              width: size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.product.description.toString(),
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: TextStylesData.extraSmallFontSize,
                    fontWeight: FontWeight.w300),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Divider(
                height: 1,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
