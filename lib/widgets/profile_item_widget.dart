
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.svgIcon,
    required this.content,
  });

  final svgIcon;
  final content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  content,
                  style: AppTextStyles.title,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                ),
              ),
              AppDimens.small.width,
              SvgPicture.asset(svgIcon),
            ],
          )),
    );
  }
}
