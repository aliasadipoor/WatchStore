import 'package:flutter/cupertino.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class Avatar extends StatelessWidget {
  final onTap;
  final file;
  const Avatar({
    super.key,
    required this.onTap,
    required this.file,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: size.width * .3,
            height: size.width * .3,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: file == null
                    ? Image.asset(Assets.png.avatar.path)
                    : Image.file(file)),
          ),
          AppDimens.medium.height,
          const Text(
            AppStrings.chooseProfileImage,
            style: AppTextStyles.avatarText,
          )
        ],
      ),
    );
  }
}
