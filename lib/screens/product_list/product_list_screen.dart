import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widgets/cart_badge_widget.dart';
import 'package:watch_store/widgets/custom_app_bar_widget.dart';
import 'package:watch_store/widgets/product_gridview_wiget.dart';
import 'package:watch_store/widgets/tag_list_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CartBadge(
              count: 5,
            ),
            Row(
              children: [
                const Text("پرفروش ترسن ها"),
                AppDimens.small.width,
                SvgPicture.asset(Assets.svg.sort),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.svg.close),
            ),
          ],
        )),
        body: const Column(
          children: [
            TagList(),
            ProductGridView(),
          ],
        ),
      ),
    );
  }
}
