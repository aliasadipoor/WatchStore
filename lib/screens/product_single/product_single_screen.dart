import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widgets/cart_badge_widget.dart';
import 'package:watch_store/widgets/custom_app_bar_widget.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          child: Row(
        children: [
          const CartBadge(),
          const Expanded(
            child: Text(
              "ساعت مردانه",
              style: AppTextStyles.productTitle,
              textDirection: TextDirection.rtl,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.svg.close),
          ),
        ],
      )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  Assets.png.unnamed.path,
                  fit: BoxFit.cover,
                  width: MediaQuery.sizeOf(context).width,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimens.medium),
                  margin: const EdgeInsets.all(AppDimens.medium),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.medium),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "بنسر",
                        style: AppTextStyles.productTitle,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        "ساعت بنسر مدل اکسترا سه موتوره",
                        style: AppTextStyles.caption,
                        textDirection: TextDirection.rtl,
                      ),
                      const Divider(),
                      const ProductTabView(),
                      const SizedBox(height: 60),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.blue,
            ),
          )
        ],
      ),
    ));
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  List<String> tabs = [
    "نقد و بررسی",
    "نظرات",
    "خصوصیات",
  ];
  var selectedTabIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() => selectedTabIndex = index),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Text(
                  tabs[index],
                  style: index == selectedTabIndex
                      ? AppTextStyles.selectedTab
                      : AppTextStyles.unSelectedTab,
                ),
              ),
            ),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: const [
            Review(),
            Comments(),
            Features(),
          ],
        )
      ],
    );
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
