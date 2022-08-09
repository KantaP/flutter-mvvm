import 'dart:async';

import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/authenticate/data/repositories/authentication.repo.dart';
import 'package:prototype/src/features/authenticate/view/di/sign_in.vm.dart';
import 'package:prototype/src/view_model/app_routes.dart';
import 'package:test/test.dart';

void main() {
  late SignInPageViewModel viewModel;
  

  setUp(() {
    viewModel = SignInPageViewModel(getIt<AuthenticationRepository>());
  });

  group('SignInPageViewModel', () {
    test('initial state starts at blank', () async {
      final state = await viewModel.state.first;

      expect(state.username, "");
      expect(state.password, "");
    });

    test('update username', () async {
      viewModel.updateUsername("aaa");

      final state = await viewModel.state.first;

      expect(state.username, "aaa");

      viewModel.dispose();
    });

    test('update password', () async {
      viewModel.updatePassword("aaa");

      final state = await viewModel.state.first;

      expect(state.password, "aaa");

      viewModel.dispose();
    });

    test('signInButtonTap pushes shopping cart page', () async {

        // delay execution so the event it caught by the Routes Publish
        scheduleMicrotask(viewModel.signIn);
        final route = await viewModel.routes.first;

        expect(route.name, '/shopping-cart');
        expect(route.action, AppRouteAction.pushTo);

        viewModel.dispose();
      });
  });
}
