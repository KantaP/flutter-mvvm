import 'package:flutter/material.dart';
import 'package:prototype/src/features/authenticate/model/create_account.st.dart';
import 'package:prototype/src/features/authenticate/view/di/create_account.vm.dart';
import 'package:prototype/src/view_model/view.abs.dart';
import 'package:prototype/src/widgets/checkbox_field.dart';

class CreateAccountPage extends View<CreateAccountViewModel> {
  const CreateAccountPage({required CreateAccountViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState(viewModel);
}

class _CreateAccountPageState
    extends ViewState<CreateAccountPage, CreateAccountViewModel> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  _CreateAccountPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CreateAccountState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(); //something went wrong. cannot get state from viewmodel
          final state = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(children: [
                IconButton(
                  onPressed: () => viewModel.goBack(),
                  icon: const Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: kToolbarHeight),
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            "Create Account",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: const InputDecoration(
                                labelText: 'Email', isDense: false),
                            controller: _usernameController,
                            onChanged: (value) {
                              viewModel.updateState(<String, dynamic>{
                                CreateAccountFields.username: value
                              });
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
                              viewModel.updateState(<String, dynamic>{
                                CreateAccountFields.password: value
                              });
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
                                labelText: 'Confirm Password', isDense: false),
                            controller: _confirmPasswordController,
                            onChanged: (value) {
                              viewModel.updateState(<String, dynamic>{
                                CreateAccountFields.confirmPassword: value
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: CheckBoxField(
                            value: state.acceptTerm,
                            label:
                                "I have read and agree to the terms of service",
                            onChanged: (value) {
                              viewModel.updateState(<String, dynamic>{
                                CreateAccountFields.acceptTerm: value
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: ElevatedButton(
                            onPressed: () => viewModel.createUser(context),
                            child: const Text('Confirm'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
