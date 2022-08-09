import 'package:flutter/material.dart';
import 'package:prototype/src/constants/routes.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/authenticate/view/create_account.p.dart';
import 'package:prototype/src/features/authenticate/view/di/create_account.vm.dart';
import 'package:prototype/src/features/authenticate/view/sign_in.p.dart';
import 'package:prototype/src/features/event/view/create_event.p.dart';
import 'package:prototype/src/features/event/view/di/create_event.vm.dart';
import 'package:prototype/src/features/event/view/di/event_list.vm.dart';
import 'package:prototype/src/features/event/view/event_list.p.dart';
import 'features/authenticate/view/di/sign_in.vm.dart';

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};
    switch (settings.name) {
      case RoutesConstant.home:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => EventListPage(viewModel: getIt<EventListViewModel>()),
        );
      case RoutesConstant.createAccount:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateAccountPage(viewModel: getIt<CreateAccountViewModel>()),
        );
      case RoutesConstant.userSignIn:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => SignInPage(viewModel: getIt<SignInPageViewModel>()),
        );
      case RoutesConstant.createEvent:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => CreateEventPage(viewModel: getIt<CreateEventViewModel>()),
        );
      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
