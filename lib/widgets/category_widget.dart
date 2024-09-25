import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.iconPath,
    required this.colors,
  });
  final title;
  final onTap;
  final colors;
  final iconPath;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            width: size.height * .1,
            height: size.height * .1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors),
                borderRadius: BorderRadius.circular(AppDimens.large)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 60,
                    child: SvgPicture.asset(
                      iconPath,
                    )),
              ],
            ),
          ),
          AppDimens.medium.height,
          Text(
            title,
            style: AppTextStyles.title.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}
