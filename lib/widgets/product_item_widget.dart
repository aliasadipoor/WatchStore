import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.productName,
    required this.price,
    this.discount = 0,
    this.time = 0,
    this.oldPrice = 0,
  });
  final productName;
  final price;
  final oldPrice;
  final discount;
  final time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(AppDimens.medium),
      height: 295,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.productBgGradiant),
      ),
      child: Column(
        children: [
          Image.asset(Assets.png.unnamed.path),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: AppTextStyles.productTitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${985454.separateWithComma} تومان",
                    style: AppTextStyles.title,
                  ),
                  Visibility(
                    visible: discount > 0 ? true : false,
                    child: Text(
                      800000.separateWithComma,
                      style: AppTextStyles.oldPriceStyle,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small * .5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red),
                  child: Text("$discount %"),
                ),
              ),
            ],
          ),
          AppDimens.large.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Container(
              width: double.infinity,
              height: 2,
              color: Colors.blue,
            ),
          ),
          AppDimens.medium.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Text(
              "12:56:49",
              style: AppTextStyles.prodTimerStyle,
            ),
          )
        ],
      ),
    );
  }
}
