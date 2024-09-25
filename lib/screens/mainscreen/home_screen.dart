import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/Search_button_widget.dart';
import 'package:watch_store/widgets/app_slider_widget.dart';
import 'package:watch_store/widgets/category_widget.dart';
import 'package:watch_store/widgets/product_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SearchButtonWidget(
              onTap: () {},
            ),
            AppDimens.medium.height,
            /* start app slider  */
            const AppSliderWidget(
              imgList: [],
            ),
            AppDimens.large.height,
            /* start categort  */
            Row(
              children: [
                CategoryWidget(
                  title: AppStrings.desktop,
                  onTap: () {},
                  iconPath: Assets.svg.desktop,
                  colors: AppColors.catDesktopColors,
                ),
                CategoryWidget(
                  title: AppStrings.digital,
                  onTap: () {},
                  iconPath: Assets.svg.digital,
                  colors: AppColors.catDigitalColors,
                ),
                CategoryWidget(
                  title: AppStrings.smart,
                  onTap: () {},
                  iconPath: Assets.svg.smart,
                  colors: AppColors.catSmartColors,
                ),
                CategoryWidget(
                  title: AppStrings.classic,
                  onTap: () {},
                  iconPath: Assets.svg.clasic,
                  colors: AppColors.catClasicColors,
                ),
              ],
            ),
            AppDimens.large.height,
            /* start product Items */
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, index) => const ProductItemWidget(
                        productName: "ساعت مردانه",
                        price: 5545,
                        discount: 35,
                      ),
                    ),
                  ),
                  const VerticalText()
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                    angle: 1.5, child: SvgPicture.asset(Assets.svg.back)),
                AppDimens.medium.width,
                const Text(AppStrings.viewAll),
              ],
            ),
            AppDimens.small.height,
            const Text(
              AppStrings.amazing,
              style: AppTextStyles.amazingStyle,
            )
          ],
        ),
      ),
    );
  }
}
