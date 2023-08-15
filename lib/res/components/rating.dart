import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';

class RatingItem extends StatelessWidget {
  final double rate;
  const RatingItem({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: RatingBar.builder(
        itemSize: 20,
        initialRating: rate,
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
    );
  }
}
