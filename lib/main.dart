import 'package:flutter/material.dart';
import 'package:watch_store/components/themes.dart';
import 'package:watch_store/routes/names.dart';
import 'package:watch_store/routes/routes.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/screens/auth/send_sms_screen.dart';
import 'package:watch_store/screens/mainscreen/cart_page.dart';
import 'package:watch_store/screens/mainscreen/main_screen.dart';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Watch Store',
        theme: lightTheme(),
        //initialRoute: ScreenNames.root,
        routes: routes,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return MainScreen();
            } else if (state is LOggetOutState) {
              return SendSmsScreen();
            } else {
              return SendSmsScreen();
            }
          },
        ),
      ),
    );
  }
}
