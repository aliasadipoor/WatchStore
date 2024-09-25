
import 'package:flutter/material.dart';
import 'package:watch_store/widgets/product_item_widget.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) =>
          const ProductItemWidget(productName: "ساعت مردانه", price: 6561),
    ));
  }
}
