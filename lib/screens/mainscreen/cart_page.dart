import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/custom_app_bar_widget.dart';
import 'package:watch_store/widgets/main_button_widget.dart';
import 'package:watch_store/widgets/shopping_cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
          child: Align(
        alignment: Alignment.centerRight,
        child: Text(AppStrings.basket),
      )),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.medium),
            margin: const EdgeInsets.only(top: AppDimens.medium),
            width: double.infinity,
            height: size.height * 0.1,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 1),
                  blurRadius: 3,
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.svg.leftArrow),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.sendToAddress,
                        style: AppTextStyles.caption,
                      ),
                      FittedBox(
                        child: Text(
                          AppStrings.lurem,
                          style: AppTextStyles.caption,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const ShopingCartWidget(
                  title: "ساعت مردمانه اپل 568",
                  price: 50000,
                  oldPrice: 1690000);
            },
          )),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.large),
                  child: Text("جمع کل: 54862 تومان"),
                )),
                SizedBox(
                  width: size.width * 0.4,
                  height: double.infinity,
                  child: MainButton(
                    text: "ادامه فرایند خرید",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
