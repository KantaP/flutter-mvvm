
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prototype/src/constants/routes.dart';
import 'package:prototype/src/theme/custom_theme.dart';
import 'routes.dart';
import 'view_model/view.abs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  final _router = AppRouter();
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      navigatorObservers: [routeObserver],
      initialRoute: RoutesConstant.userSignIn,
      onGenerateRoute: _router.route,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}