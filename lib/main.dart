import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/providers/theme_provider.dart';
import 'package:portfolio_website/screens/home/controller/home_controller.dart';
import 'package:portfolio_website/screens/main/main_screen.dart';
import 'package:portfolio_website/screens/splash_screen.dart';
import 'package:portfolio_website/services/router.dart';
import 'package:portfolio_website/services/scroll_behavior.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ko', 'KR')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      // child: MaterialApp.router(
      //   debugShowCheckedModeBanner: false,
      //   routerConfig: router,
      //   title: 'Parrott Kim',
      //   theme: darkTheme,
      //   scrollBehavior: CustomScrollBehavior(),
      // ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parrott Kim',
        theme: darkTheme,
        scrollBehavior: CustomScrollBehavior(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplashScreen(),
      ),
    );
  }
}
