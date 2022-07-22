import 'package:flutter/material.dart';
import 'package:prototype/src/features/authenticate/view/sign_in.vm.dart';
import 'package:prototype/src/view_model/view.abs.dart';

import '../model/sign_in.st.dart';

class SignInPage extends View<SignInPageViewModel> {
  SignInPage({required SignInPageViewModel viewModel , Key? key}) : super.model(viewModel, key: key);

  @override
  _SignInPageState createState() => _SignInPageState(viewModel);
}

class _SignInPageState extends ViewState<SignInPage, SignInPageViewModel> {
  _SignInPageState(SignInPageViewModel viewModel) : super(viewModel);

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
              appBar: AppBar(
                title: const Text('Home Page'),
              ),
              body: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        onChanged: ((value) => viewModel.updateUsername(value)),
                      ),
                      TextField(
                        onChanged: ((value) => viewModel.updatePassword(value)),
                      ),
                      Text(state.username),
                      Text(state.password),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.signIn();
                        },
                        child: const Text('LOG IN'),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
