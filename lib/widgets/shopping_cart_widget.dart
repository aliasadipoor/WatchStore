import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/widgets/suraface_conainer.dart';

class ShopingCartWidget extends StatelessWidget {
  ShopingCartWidget({
    super.key,
    required this.title,
    required this.count,
    this.add,
    this.remove,
    this.delete,
  });
  int count = 0;
  final title;
  final add;
  final remove;
  final delete;
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
              const Divider(),
              Row(
                children: [
                  IconButton(
                    onPressed: delete,
                    icon: SvgPicture.asset(Assets.svg.delete),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: remove,
                    icon: SvgPicture.asset(Assets.svg.minus),
                  ),
                  Text("عدد $count"),
                  IconButton(
                    onPressed: add,
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
