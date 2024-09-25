import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({
    super.key,
    required this.child,
  });

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.medium),
      margin: const EdgeInsets.fromLTRB(
        AppDimens.medium,
        AppDimens.medium,
        AppDimens.medium,
        0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.medium),
          color: AppColors.surfaceColor),
      child: child,
    );
  }
}
