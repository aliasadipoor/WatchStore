

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/widgets/suraface_conainer.dart';

class ShopingCartWidget extends StatelessWidget {
  const ShopingCartWidget({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
  });
  final title;
  final int price;
  final int oldPrice;
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppTextStyles.productTitle,
              ),
              Text(
                "قیمت: ${price.separateWithComma} تومان",
                style: AppTextStyles.caption,
              ),
              Text(
                "با تخفیف: ${oldPrice.separateWithComma} تومان",
                style: AppTextStyles.productTitle
                    .copyWith(color: AppColors.primaryColor),
              ),
              const Divider(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.delete),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.minus),
                  ),
                  Text("عدد $count"),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.plus),
                  ),
                ],
              )
            ],
          ),
        ),
        Image.asset(Assets.png.unnamed.path),
      ],
    ));
  }
}
