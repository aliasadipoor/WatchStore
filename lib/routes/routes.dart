import 'package:flutter/cupertino.dart';
import 'package:watch_store/routes/names.dart';
import 'package:watch_store/screens/auth/send_sms_screen.dart';
import 'package:watch_store/screens/auth/verifycode_creen.dart';
import 'package:watch_store/screens/mainscreen/main_screen.dart';
import 'package:watch_store/screens/product_single/product_single_screen.dart';
import 'package:watch_store/screens/register/register_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  
  ScreenNames.sendSmsScreen: (context) => SendSmsScreen(),
  ScreenNames.verifyCodeScreen: (context) => VerifyCodeScreen(),
  ScreenNames.registerScreen: (context) => RegisterScreen(),
  ScreenNames.mainScreen: (context) =>  MainScreen(),
  // ScreenNames.productSingleScreen: (context) => const ProductSingleScreen(),
};
