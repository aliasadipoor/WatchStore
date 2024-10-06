import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/routes/names.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/avatar.dart';
import 'package:watch_store/widgets/main_button_widget.dart';
import 'package:watch_store/widgets/registeration_app_bar.dart';

//sasansafari_dev

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;
  ImageHandler imageHandler = ImageHandler();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: RegisterationAppBar(size: size),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.large.height,
                  Avatar(
                      onTap: () async => await imageHandler
                          .pickAndCropImage(source: ImageSource.gallery)
                          .then((value) => setState(() {})),
                      file: imageHandler.getIamge ),
                  AppTextField(
                    lable: AppStrings.nameLastName,
                    hint: AppStrings.hintNameLastName,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    lable: AppStrings.homeNumber,
                    hint: AppStrings.hintHomeNumber,
                    controller: _controllerPhone,
                  ),
                  AppTextField(
                    lable: AppStrings.address,
                    hint: AppStrings.hintAddress,
                    controller: _controllerAddress,
                  ),
                  AppTextField(
                    lable: AppStrings.postalCode,
                    hint: AppStrings.hintPostalCode,
                    controller: _controllerPostalCode,
                  ),
                  AppTextField(
                    lable: AppStrings.location,
                    hint: AppStrings.hintLocation,
                    controller: _controllerLocation,
                    icon: const Icon(Icons.location_on),
                  ),
                  AppDimens.medium.height,
                  MainButton(
                    text: AppStrings.register,
                    onPressed: () =>
                        Navigator.pushNamed(context, ScreenNames.mainScreen),
                  ),
                  AppDimens.medium.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
