import 'package:flutter/material.dart';
import 'package:prototype/src/constants/routes.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/authenticate/view/sign_in.p.dart';
import 'package:prototype/src/features/shopping_cart/view/shopping_cart.p.dart';
import 'package:prototype/src/features/shopping_cart/view/di/shopping_cart.vm.dart';
import 'features/authenticate/view/sign_in.vm.dart';

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};
    switch (settings.name) {
      case RoutesConstant.home:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => SignInPage(viewModel: SignInPageViewModel()),
        );
      case RoutesConstant.shoppingCart:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ShoppingCartPage(viewModel: getIt<ShoppingCartPageViewModel>()),
        );
      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
