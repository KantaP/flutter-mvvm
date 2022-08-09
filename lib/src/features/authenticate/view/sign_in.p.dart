import 'package:flutter/material.dart';
import 'package:prototype/src/constants/assets.dart';
import 'package:prototype/src/features/authenticate/view/di/sign_in.vm.dart';
import 'package:prototype/src/view_model/view.abs.dart';

import '../model/sign_in.st.dart';

class SignInPage extends View<SignInPageViewModel> {
  SignInPage({required SignInPageViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SignInPageState createState() => _SignInPageState(viewModel);
}

class _SignInPageState extends ViewState<SignInPage, SignInPageViewModel> {
  _SignInPageState(SignInPageViewModel viewModel) : super(viewModel);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SignInPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final state = snapshot.data!;

          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: kToolbarHeight),
                        child: Center(
                          child: Image.asset(
                            Assets.logo,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                              labelText: 'Email', isDense: false),
                          controller: _usernameController,
                          onChanged: (value) {
                            viewModel.updateUsername(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              labelText: 'Password', isDense: false),
                          controller: _passwordController,
                          onChanged: (value) {
                            viewModel.updatePassword(value);
                          },
                        ),
                      ),
                      Center(
                        child: IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 32.0),
                                child: ElevatedButton(
                                  onPressed: () => viewModel.signIn(),
                                  child: const Text('Sign In'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: ElevatedButton(
                                  onPressed: () => viewModel.goToCreateAccount(),
                                  child: const Text('Create Account'),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
