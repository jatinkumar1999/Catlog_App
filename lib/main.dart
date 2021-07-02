import 'package:chat_app_example/Pages/cartpage.dart';

import 'package:chat_app_example/core/store.dart';
import 'package:chat_app_example/widget/Theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/Home_Page.dart';
import 'Pages/Login_Page.dart';
import 'Utils/Routes.dart';

void main() {
  runApp(VxState(
    store:MyStore(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog App',
      themeMode: ThemeMode.system,
      theme: MyTheme().lightTheme(context),
      darkTheme: MyTheme().darkTheme(context),
      initialRoute: MyRoutes.homePage,
      routes: {
        "/": (_) => const LoginPage(),
        MyRoutes.homePage: (_) => const HomePage(),
        MyRoutes.loginPage: (_) => const LoginPage(),
        MyRoutes.cartPage: (_) => const CartPage(),
      },
    );
  }
}
