import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/data/model/product_details.dart';
import 'package:watch_store/data/repository/cart_repo.dart';
import 'package:watch_store/data/repository/product_repo.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store/screens/product_single/bloc/product_single_bloc.dart';
import 'package:watch_store/widgets/cart_badge_widget.dart';
import 'package:watch_store/widgets/custom_app_bar_widget.dart';

class ProductSingleScreen extends StatelessWidget {
  final id;
  const ProductSingleScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productBloc = ProductSingleBloc(productRepository);
        productBloc.add(ProductSingleInit(id: id));
        return productBloc;
      },
      child: BlocBuilder<ProductSingleBloc, ProductSingleState>(
        builder: (context, state) {
          if (state is ProductSingleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSingleLoaded) {
            return SafeArea(
                child: Scaffold(
              appBar: CustomAppBar(
                  child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: cartRepository.cartCount,
                    builder: (context, value, child) {
                      return CartBadge(
                        count: value,
                      );
                    },
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        state.productDetailes.title ?? "",
                        style: AppTextStyles.productTitle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(Assets.svg.close),
                  ),
                ],
              )),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network(
                          state.productDetailes.image!,
                          fit: BoxFit.cover,
                          scale: 1,
                          //  width: MediaQuery.sizeOf(context).width,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppDimens.medium),
                          margin: const EdgeInsets.all(AppDimens.medium),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.medium),
                              color: AppColors.mainBg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                state.productDetailes.brand!,
                                style: AppTextStyles.productTitle,
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                state.productDetailes.title!,
                                style: AppTextStyles.caption,
                                textDirection: TextDirection.rtl,
                              ),
                              const Divider(),
                              ProductTabView(
                                productDetailes: state.productDetailes,
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocConsumer<CartBloc, CartState>(
                    listener: (cartContext, cartState) {
                      if (cartState is CartItemAddedState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: AppColors.success,
                            content: Text(
                              "با موفقیت به سبد خرید افزده شد",
                              style: AppTextStyles.caption
                                  .copyWith(color: AppColors.onSuccess),
                              textAlign: TextAlign.center,
                            )));
                      }
                    },
                    builder: (cartContext, cartState) {
                      if (cartState is CartLoadingState) {
                        return const Positioned(
                            bottom: 0,
                            left: 24,
                            right: 24,
                            child: LinearProgressIndicator());
                      }
                      return Positioned(
                          bottom: 0,
                          left: 24,
                          right: 24,
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    AddToCartEvent(state.productDetailes.id!));
                              },
                              child: const Text("افزودن به سبد خرید",
                                  style: AppTextStyles.mainbuttn)));
                    },
                  )
                ],
              ),
            ));
          } else if (state is ProductSingleErorr) {
            return const Text("erorr");
          } else {
            throw Exception("invalid");
          }
        },
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  final ProductDetailes productDetailes;
  const ProductTabView({super.key, required this.productDetailes});

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
          children: [
            Review(text: widget.productDetailes.discussion!),
            CommentList(comments: widget.productDetailes.comments!),
            PropertiesList(
              properties: widget.productDetailes.properties!,
            ),
          ],
        )
      ],
    );
  }
}

class PropertiesList extends StatelessWidget {
  final List<Properties> properties;
  const PropertiesList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: properties.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.medium),
          color: AppColors.surfaceColor,
          child: Text(
            "${properties[index].property} : ${properties[index].value}",
            style: AppTextStyles.caption,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}

class Review extends StatelessWidget {
  final text;
  const Review({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class CommentList extends StatelessWidget {
  final List<Comments> comments;
  const CommentList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: comments.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.medium),
          color: AppColors.surfaceColor,
          child: Text(
            "${comments[index].user} : ${comments[index].body}",
            style: AppTextStyles.caption,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}
