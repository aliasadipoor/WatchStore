import 'package:flutter/cupertino.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class Avatar extends StatelessWidget {
  final onTap;
  final image;
  const Avatar({
    super.key,
    required this.onTap,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
  //  final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        AppDimens.medium.height,
        SizedBox(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(Assets.png.avatar.path)),
        ),
        AppDimens.medium.height,
        const Text(
          AppStrings.chooseProfileImage,
          style: AppTextStyles.avatarText,
        )
      ],
    );
  }
}
