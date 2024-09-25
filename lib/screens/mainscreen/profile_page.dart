import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/custom_app_bar_widget.dart';
import 'package:watch_store/widgets/profile_item_widget.dart';
import 'package:watch_store/widgets/suraface_conainer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.profile,
            style: AppTextStyles.title,
          ),
        )),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.large.height,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(Assets.png.avatar.path),
                  ),
                  AppDimens.medium.height,
                  const Text(
                    "ساسان صفری",
                    style: AppTextStyles.avatarText,
                  ),
                  AppDimens.medium.height,
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.activeAddress,
                      style: AppTextStyles.title,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.svg.leftArrow),
                          const Expanded(
                            child: Text(
                              AppStrings.lurem,
                              style: AppTextStyles.title,
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      )),
                  AppDimens.small.height,
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: AppColors.surfaceColor,
                  ),
                  AppDimens.small.height,
                  ProfileItem(
                    svgIcon: Assets.svg.user,
                    content: "ساسان صفری",
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.cart,
                    content: "57874",
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.phone,
                    content: "136554",
                  ),
                  const SurfaceContainer(child: Text("قوانین"))
                ],
              ),
            ),
          ),
        ));
  }
}
