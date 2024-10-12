import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/data/repository/product_repo.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store/widgets/cart_badge_widget.dart';
import 'package:watch_store/widgets/custom_app_bar_widget.dart';
import 'package:watch_store/widgets/product_gridview_wiget.dart';
import 'package:watch_store/widgets/product_item_widget.dart';
import 'package:watch_store/widgets/tag_list_widget.dart';

class ProductListScreen extends StatelessWidget {
  final param;
  const ProductListScreen({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productListBloc = ProductListBloc(productRepository);
        productListBloc.add(ProductListInit(param: param));
        return productListBloc;
      },
      child: SafeArea(
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
            body: Column(
              children: [
                TagList(),
                BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                    if (state is ProductListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductListLoaded) {
                      return Expanded(
                          child: GridView.builder(
                              itemCount: state.productList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: 0.5),
                              itemBuilder: (context, index) => ProductItem(
                                    product: state.productList[index],
                                  )));
                    } else if (state is ProductListError) {
                      return const Text("error");
                    } else {
                      throw Exception("invalid state");
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
